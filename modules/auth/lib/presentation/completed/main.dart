import 'package:flutter/material.dart';

import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import '../../data/user.dart';
import '../button.dart';
import '../completed/referred.dart';
import '../scaffold.dart';

class AuthCompletedPage extends HookConsumerWidget {
  static const pageName = 'completed';

  const AuthCompletedPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = useState(true);
    final referredBy = useState(referrals.first);
    final user = AuthBox.useUser();
    final textTheme = Theme.of(context).textTheme;
    return AuthScaffold(
      center: true,
      headerPadding: const EdgeInsets.only(top: 74, bottom: 36),
      header: imageAsset(
        AssetProvider.signingTermsBanner,
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
      body: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: const Text('Help us Understand better').labelLarge(),
        ),
        const SizedBox(height: 13),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: const Text('How you came to know about us')
                    .titleSmall(color: defaultDarkGreyColor),
              ),
              const SizedBox(height: 5),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 16, right: 9),
                decoration: BoxDecoration(
                  color: defaultWhiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: defaultLightGreyColor),
                ),
                child: DropdownButton(
                  iconSize: 35,
                  value: referredBy.value,
                  underline: const SizedBox(
                    width: 0,
                    height: 0,
                  ),
                  style:
                      textTheme.bodyLarge!.copyWith(color: defaultBlackColor),
                  isExpanded: true,
                  items: referrals
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child:
                              Text(e.name).bodyLarge(color: defaultBlackColor),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => referredBy.value = value!,
                ),
              )
            ],
          ),
        ),
        const ConstraintFlexible(
          maxHeight: 50,
          minHeight: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppCheckBox(
              isChecked: isChecked.value,
              onCheckChanged: (value) {
                isChecked.value = value;
              },
            ),
            const SizedBox(width: 16),
            Flexible(
                child: GestureDetector(
              onTap: () => isChecked.value = !isChecked.value,
              child: const Text(
                'I hereby promise & swear by Allah that all the details and documents are valid and belongs to me and I also swear that there is no fraud of cheating or loop-hole from my side.',
                overflow: TextOverflow.visible,
              ).bodyLarge(color: blackColor),
            )),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: 165,
          child: AuthButton(
              enabled: isChecked.value,
              text: "Continue",
              onPressed: () {
                final authData = ref.read(authDataProvider) as RegisterData;
                ref.read(authDataProvider.notifier).clear();
                user.value = User(
                  id: "123",
                  name: authData.name,
                  userName: "+${authData.country.code}${authData.phone}",
                  role: UserRole.student,
                  photoUrl: "https://i.ibb.co/KD9jZTk/dp.png",
                );
                context.go(DashboardRoutes.overviewPath());
              }),
        )
      ],
    );
  }
}
