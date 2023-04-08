import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/field.dart';
import 'package:auth/presentation/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import '../appbar.dart';
import '../scaffold.dart';
import 'viewmodel.dart';

class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage(
      {super.key});

  static const pageName = 'forgot-password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final forgotPasswordData = ref.watch(authDataProvider) as ForgotPasswordData;

    final viewModel = useMemoized(() => ForgotPasswordViewModel(GetIt.I()), []);

    final country = useState(forgotPasswordData.country);

    final phoneHandler = useTextFieldHandler(
      keyboardType: TextInputType.phone,
      validator: (value) => viewModel.validatePhone(value, country.value),
      initialText: forgotPasswordData.phone,
    );
    return AuthScaffold(
      appBar: const AuthAppbar(),
      headerPadding: const EdgeInsets.only(top: 50, bottom: 41),
      header: imageAsset(
        AssetProvider.forgotPasswordBanner,
        height: 180,
        width: 238,
        fit: BoxFit.contain,
      ),
      body: [
        const Text("Forgot\nPassword").headlineMedium(),
        const SizedBox(height: 15),
        const Text(
                "Don't worry! it happens. Please enter the  number associated with your account.")
            .bodyLarge(color: defaultDarkGreyColor),
        const SizedBox(height: 36),
        AuthPhoneField(
            initialCountry: country.value,
            handler: phoneHandler,
            hintText: 'Phone Number',
            onCountryChanged: (value) {
              country.value = value;
            }),
        const SizedBox(height: 39),
      ],
      actionLabel: "Get OTP",
      onAction: () async {
        final isPhoneValid = phoneHandler.validate();
        if (!isPhoneValid) return;
        ForgotPasswordData forgotPasswordData = ForgotPasswordData(
          phone: phoneHandler.text,
          country: country.value,
        );
        ref.read(authDataProvider.notifier).setForgotPasswordData(forgotPasswordData);
        context.push(AuthRoutes.otpPath());
      },
    );
  }
}
