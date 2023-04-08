import 'package:auth/auth.dart';
import 'package:go_router/go_router.dart';

import '../transition.dart';

const _primaryName = 'auth';

final _authRoutes = [
  goRoute(
    path: AuthRoutes.gatewayPath(),
    builder: (context, state) => const AuthGatewayPage(),
  ),
  goRoute(
    path: AuthRoutes.otpPath(),
    builder: (context, state) => const OtpPage(),
  ),
  goRoute(
    path: AuthRoutes.walkthroughPath(),
    builder: (context, state) => const WalkthroughPage(),
    animType: "fade",
  ),
  goRoute(
    path: AuthRoutes.loginPath(),
    builder: (context, state) => const LoginPage(),
  ),
  goRoute(
    path: AuthRoutes.registerPath(),
    builder: (context, state) => const RegisterPage(),
  ),
  goRoute(
    path: AuthRoutes.forgotPasswordPath(),
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  goRoute(
    path: AuthRoutes.resetPasswordPath(),
    builder: (context, state) => const ResetPasswordPage(),
  ),
  goRoute(
    path: AuthRoutes.setPasswordPath(),
    builder: (context, state) => const SetPasswordPage(),
  ),
  goRoute(
    path: AuthRoutes.completedPath(),
    builder: (context, state) => const AuthCompletedPage(),
  ),
];

class AuthRoutes {
  static List<GoRoute> get routes => _authRoutes;
  static String gatewayPath() => '/$_primaryName/${AuthGatewayPage.pageName}';
  static String otpPath() =>
      '/$_primaryName/${OtpPage.pageName}';
  // static String get otpTemplate => '/$_primaryName/${OtpPage.pageName}';
  static String walkthroughPath() =>
      '/$_primaryName/${WalkthroughPage.pageName}';
  static String loginPath() => '/$_primaryName/${LoginPage.pageName}';
  static String registerPath() => '/$_primaryName/${RegisterPage.pageName}';
  static String forgotPasswordPath() =>
      '/$_primaryName/${ForgotPasswordPage.pageName}';
  // static String get forgotPasswordTemplate => '/$_primaryName/${ForgotPasswordPage.pageName}';

  static String resetPasswordPath() =>
      '/$_primaryName/${ResetPasswordPage.pageName}';
  static String setPasswordPath() =>
      '/$_primaryName/${SetPasswordPage.pageName}';
  static String completedPath() =>
      '/$_primaryName/${AuthCompletedPage.pageName}';
}
