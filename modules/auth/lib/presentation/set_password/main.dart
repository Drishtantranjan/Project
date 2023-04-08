import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/provider.dart';
import 'package:flutter/material.dart';

import 'package:auth/presentation/field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/modules/auth.dart';
import 'package:styles/styles.dart';

import '../appbar.dart';
import '../scaffold.dart';
import 'viewmodel.dart';

class SetPasswordPage extends HookConsumerWidget {
  const SetPasswordPage({super.key});

  static const pageName = 'set-password';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = useMemoized(() => SetPasswordViewModel(GetIt.I()), []);
    final passwordHandler = useTextFieldHandler(
      imeNext: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => viewModel.validatePassword(value),
    );
    final confirmPasswordHandler = useTextFieldHandler(
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => viewModel.validateConfirmPassword(value, passwordHandler.text),
    );
    return AuthScaffold(
      appBar: const AuthAppbar(),
      headerPadding: const EdgeInsets.only(top: 81, bottom: 41),
      header: imageAsset(
        AssetProvider.setPasswordBanner,
        height: 180,
      ),
      body: [
        const Text("Set\nPassword").headlineMedium(),
        const SizedBox(height: 31),
        AuthPasswordField(
            handler: passwordHandler, labelText: 'Password'),
        const SizedBox(height: 21),
        AuthPasswordField(
            handler: confirmPasswordHandler,
            labelText: 'Confirm Password'),
        const SizedBox(height: 39),
      ],
      actionLabel: "Get OTP",
      onAction: () async {
        final isPasswordValid = passwordHandler.validate();
        final isConfirmPasswordValid = confirmPasswordHandler.validate();
        if (!isPasswordValid || !isConfirmPasswordValid) return;
        RegisterData setPasswordData = ref.read(authDataProvider) as RegisterData;
        setPasswordData = setPasswordData.copyWith(
          password: passwordHandler.text,
        );
        ref.read(authDataProvider.notifier).setRegisterData(setPasswordData);
        context.push(AuthRoutes.otpPath());
      },
    );
  }
}
