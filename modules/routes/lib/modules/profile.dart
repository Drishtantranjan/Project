import 'package:go_router/go_router.dart';
import 'package:profile/profile.dart';
import 'package:routes/transition.dart';

const _primaryName = 'profile';

final _profileRoutes = [
  goRoute(
    path: ProfileRoutes.addPath(),
    builder: (context, state) => const ProfileAddPage(),
  ),
  goRoute(
    path: ProfileRoutes.viewPath(),
    builder: (context, state) => const ProfileViewPage(),
  ),
];

class ProfileRoutes {
  const ProfileRoutes._();
  static List<GoRoute> get routes => _profileRoutes;
  static String addPath() => '/$_primaryName/${ProfileAddPage.pageName}';
  static String viewPath() => '/$_primaryName/${ProfileViewPage.pageName}';
}
