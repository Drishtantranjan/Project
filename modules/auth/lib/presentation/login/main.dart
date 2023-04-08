import 'package:flutter/material.dart';

import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/input_decoration.dart';
import 'package:auth/presentation/login/viewmodel.dart';
import 'package:auth/presentation/provider.dart';
import 'package:auth/presentation/scaffold.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/modules/auth.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import '../button.dart';
import '../field.dart';
import '../role_state.dart';

import 'provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  static const pageName = 'login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(roleProvider);

    final viewModel = useMemoized(() => LoginViewModel(GetIt.I()), []);
    final country = useRef(countryIndia);

    final studentPhoneHandler = useTextFieldHandler(
      keyboardType: TextInputType.phone,
      imeNext: true,
      validator: (value) => viewModel.validatePhone(value, country.value),
    );

    final userIdHandler = useTextFieldHandler(
      keyboardType: TextInputType.emailAddress,
      imeNext: true,
      validator: (value) => viewModel.validateUserId(value),
    );

    final studentPasswordHandler = useTextFieldHandler(
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => viewModel.validatePwd(value),
    );

    final teacherPasswordHandler = useTextFieldHandler(
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => viewModel.validatePwd(value),
    );

    final tabController =
        useTabController(initialLength: 2, initialIndex: role.index);
    final textTheme = Theme.of(context).textTheme;

    tabListener() {
      if (tabController.index == 0) {
        ref.read(roleProvider.notifier).setStudentRole();
      } else {
        ref.read(roleProvider.notifier).setTeacherRole();
      }
    }

    useEffect(() {
      tabController.addListener(tabListener);
      return () => tabController.removeListener(tabListener);
    }, [tabController]);

    return AuthScaffold(
      headerPadding: const EdgeInsets.only(top: 81, bottom: 30),
      header: imageAsset(
        AssetProvider.loginBanner,
        height: 180,
      ),
      body: [
        Center(
          child: SizedBox(
            width: 200,
            child: TabBar(
              labelColor: defaultBlackColor,
              indicatorColor: primaryColor,
              unselectedLabelColor: defaultLightGreyColor,
              labelStyle: textTheme.labelLarge,
              tabs: const [
                Tab(text: 'Student'),
                Tab(text: 'Teacher'),
              ],
              controller: tabController,
            ),
          ),
        ),
        const MaxHeight(28),
        SizedBox(
          width: double.infinity,
          child: const Text('Login').headlineMedium(),
        ),
        const MaxHeight(22),
        if (role == Role.student)
          AuthPhoneField(
            key: const ValueKey("student_phone_field"),
            initialCountry: country.value,
            handler: studentPhoneHandler,
            onCountryChanged: (c) {
              country.value = c;
            },
          )
        else
          AuthField(
            key: const ValueKey("teacher_id_field"),
            handler: userIdHandler,
            labelText: "User Id",
          ),
        const MaxHeight(20),
        if (role == Role.student)
          AuthPasswordField(
            key: const ValueKey("student_pwd_field"),
            handler: studentPasswordHandler,
          )
        else
          AuthPasswordField(
            key: const ValueKey("teacher_pwd_field"),
            handler: teacherPasswordHandler,
          ),
        const MaxHeight(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AuthTextButton(
                text: 'Forgot Password?',
                onPressed: () {
                  final role = ref.read(roleProvider);
                  String phoneNumber = "";

                  if (role == Role.student && studentPhoneHandler.isValid) {
                    phoneNumber = studentPhoneHandler.text;
                  }

                  final notifier = ref.read(authDataProvider.notifier);
                  notifier.setForgotPasswordData(ForgotPasswordData(
                    phone: phoneNumber,
                    country: country.value,
                  ));

                  context.push(AuthRoutes.forgotPasswordPath());
                }),
          ],
        ),
        const MaxHeight(20),
      ],
      actionLabel: "Login",
      onAction: () async {
        final role = ref.read(roleProvider);
        if (role == Role.student) {
          final isPhoneValid = studentPhoneHandler.validate();
          final isPwdValid = studentPasswordHandler.validate();
          if (isPhoneValid && isPwdValid) {
            final notifier = ref.read(authDataProvider.notifier);
            notifier.setLoginData(
              StudentLoginData(
                phone: studentPhoneHandler.text,
                password: studentPasswordHandler.text,
                country: country.value,
              ),
            );
            context.push(AuthRoutes.otpPath());
          }
        } else {
          final isUserIdValid = userIdHandler.validate();
          final isPwdValid = teacherPasswordHandler.validate();
          if (isUserIdValid && isPwdValid) {
            final notifier = ref.read(authDataProvider.notifier);
            if (userIdHandler.text == "admin") {
              notifier.setLoginData(
                AdminLoginData(
                  userId: userIdHandler.text,
                  password: teacherPasswordHandler.text,
                ),
              );
            } else {
              notifier.setLoginData(
                TeacherLoginData(
                  userId: userIdHandler.text,
                  password: teacherPasswordHandler.text,
                ),
              );
            }
            context.push(AuthRoutes.otpPath());
          }
        }
      },
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('New User?').bodyLarge(),
          AuthLinkButton(
              text: 'Register',
              onPressed: () {
                context.push(AuthRoutes.registerPath());
              }),
        ],
      ),
    );
  }
}
