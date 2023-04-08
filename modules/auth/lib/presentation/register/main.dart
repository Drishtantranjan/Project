import 'package:flutter/material.dart';

import 'package:auth/presentation/appbar.dart';
import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/field.dart';
import 'package:auth/presentation/input_decoration.dart';
import 'package:auth/presentation/provider.dart';
import 'package:auth/presentation/register/viewmodel.dart';
import 'package:auth/presentation/scaffold.dart';
import 'package:auth/presentation/text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/modules/auth.dart';
import 'package:routes/modules/docs.dart';
import 'package:styles/styles.dart';

import '../button.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  static const pageName = 'register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = useState(countryIndia);

    final viewModel = useMemoized(() => RegisterViewModel(GetIt.I()), []);
    final nameHandler = useTextFieldHandler(
      imeNext: true,
      keyboardType: TextInputType.name,
      validator: (value) => viewModel.validateName(value),
    );
    final phoneHandler = useTextFieldHandler(
      keyboardType: TextInputType.phone,
      validator: (value) => viewModel.validatePhone(value, country.value),
    );

    onTandCPressed() {
      context.push(DocsRoutes.termsAndConditionsPath());
    }

    onPrivacyPolicyPressed() {
      context.push(DocsRoutes.privacyPolicyPath());
    }

    return AuthScaffold(
      appBar: const AuthAppbar(),
      headerPadding: const EdgeInsets.only(top: 81, bottom: 61),
      header: imageAsset(
        AssetProvider.signupBanner,
        height: 180,
      ),
      body: [
        const Text('Signup').headlineMedium(),
        const SizedBox(height: 23),
        AuthField(handler: nameHandler, labelText: 'Name'),
        const SizedBox(height: 20),
        AuthPhoneField(
          initialCountry: country.value,
          handler: phoneHandler,
          hintText: 'Phone Number',
          onCountryChanged: (c) {
            country.value = c;
          },
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            const Text('By continuing, you agree to the'),
            ClickableText(
              text: 'Terms & Conditions',
              onPressed: onTandCPressed,
            ),
          ],
        ),
        Row(
          children: [
            const Text('and '),
            ClickableText(
              text: 'Privacy Policy',
              onPressed: onPrivacyPolicyPressed,
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
      actionLabel: "Continue",
      onAction: () async {
        final isNameValid = nameHandler.validate();
        final isPhoneValid = phoneHandler.validate();
        if (isNameValid && isPhoneValid) {
          final name = nameHandler.text;
          final phone = phoneHandler.text;

          ref.read(authDataProvider.notifier).setRegisterData(
                RegisterData(
                    name: name,
                    phone: phone,
                    country: country.value,
                    password: ""),
              );
          context.push(AuthRoutes.setPasswordPath());
        }
      },
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Joined us before?').bodyLarge(),
          AuthLinkButton(
              text: 'Login',
              onPressed: () {
                context.pop();
              }),
        ],
      ),
    );
  }
}
