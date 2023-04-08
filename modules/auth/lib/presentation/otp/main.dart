import 'package:flutter/material.dart';

import 'package:auth/data/user.dart';
import 'package:auth/presentation/appbar.dart';
import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/provider.dart';
import 'package:auth/presentation/role_state.dart';
import 'package:auth/presentation/scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import '../button.dart';

import 'text_field.dart';

class OtpPage extends HookConsumerWidget {
  static const pageName = 'otp';

  const OtpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useMemoized(() => OtpFieldController(), []);
    final otpPin = useState("");
    final user = AuthBox.useUser();
    return AuthScaffold(
        center: true,
        appBar: const AuthAppbar(),
        headerPadding: const EdgeInsets.only(top: 86, bottom: 40),
        header: imageAsset(
          AssetProvider.otpBannerDoggy,
          height: 250,
        ),
        body: [
          const Text('OTP Verification').headlineMedium(),
          const SizedBox(height: 7),
          const Text(
                  'Please confirm your account by entering the authentication alpha-numeric code sent to ******8124')
              .bodyLarge().alignCenter(),
          const SizedBox(height: 44),
          OTPTextField(
            length: 5,
            keyboardType: TextInputType.visiblePassword,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            width: 302,
            height: 60,
            fieldWidth: 50,
            spaceBetween: 13,
            isDense: true,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: defaultDarkGreyColor,
                ),
            fieldStyle: FieldStyle.box,
            otpFieldStyle: OtpFieldStyle(
              borderColor: const Color(0xFF8E8E8E),
              backgroundColor: const Color(0xFFF4F4F4),
            ),
            onCompleted: (pin) {},
            controller: otpController,
            onChanged: (pin) {
              otpPin.value = pin;
            },
          ),
          const SizedBox(height: 32),
        ],
        actionLabel: "Continue",
        actionEnabled: otpPin.value.length == 5,
        onAction: () async {
          if (otpPin.value.length != 5) {
            return;
          }
    
          final authData = ref.read(authDataProvider) as AuthData;
    
          if (authData is LoginData) {
            ref.read(authDataProvider.notifier).clear();
            if (authData.role == Role.student) {
              final studentData = authData as StudentLoginData;
              user.value = User(id: "123", name: "Naruto Uzumaki", userName: "+${studentData.country.code}${studentData.phone}", role: UserRole.student, photoUrl: "https://i.ibb.co/KD9jZTk/dp.png");
            } else if (authData.role == Role.teacher) {
              final teacherData = authData as TeacherLoginData;
              user.value = User(id: "123", name: "Naruto Uzumaki", userName: teacherData.userId, role: UserRole.teacher, photoUrl: "https://i.ibb.co/KD9jZTk/dp.png");
            } else if (authData.role == Role.admin) {
              final adminData = authData as AdminLoginData;
              user.value = User(id: "123", name: "Naruto Uzumaki", userName: adminData.userId, role: UserRole.admin, photoUrl: "https://i.ibb.co/KD9jZTk/dp.png");
            }
            context.go(DashboardRoutes.overviewPath());
          } else if (authData is RegisterData) {
            context.push(AuthRoutes.completedPath());
          } else if (authData is ForgotPasswordData) {
            context.push(AuthRoutes.resetPasswordPath());
          }
        },
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Haven't received it?").bodyLarge(),
            AuthLinkButton(
                text: 'Resend a new Code',
                onPressed: () {
                  // context.push(AuthRoutes.registerPath());
                }),
          ],
        ),
      );
  }
}
