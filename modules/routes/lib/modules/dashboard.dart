import 'package:dashboard/dashboard.dart';
import 'package:go_router/go_router.dart';

import '../transition.dart';

const _primaryName = 'dashboard';

final _dashboardRoutes = [
  goRoute(
    path: DashboardRoutes.overviewPath(),
    builder: (context, state) => const DashboardOverviewPage(),
  ),
  goRoute(
    path: DashboardRoutes.notificationPath(),
    builder: (context, state) => const NotificationPage(),
  ),
  goRoute(
    path: DashboardRoutes.requestBatchPath(),
    builder: (context, state) => const RequestBatchPage(),
  ),
  goRoute(
    path: DashboardRoutes.searchPath(),
    builder: (context, state) => SearchPage(categoryFromRoute: state.extra as String?),
  ),
  goRoute(
    path: DashboardRoutes.libraryPath(),
    builder: (context, state) => const LibraryPage(),
  ),
  goRoute(
    path: DashboardRoutes.amazingAppsPath(),
    builder: (context, state) => const AmazingApps(),
  ),
  goRoute(
    path: DashboardRoutes.aboutUsPath(),
    builder: (context, state) => const AboutUsPage(),
  ),
];

class DashboardRoutes {
  const DashboardRoutes._();
  static List<GoRoute> get routes => _dashboardRoutes;
  static String overviewPath() =>
      '/$_primaryName/${DashboardOverviewPage.pageName}';
  static String notificationPath() =>
      '/$_primaryName/${NotificationPage.pageName}';

  static String requestBatchPath() =>
      '/$_primaryName/${RequestBatchPage.pageName}';

  static String searchPath() => '/$_primaryName/${SearchPage.pageName}';
  static String libraryPath() => '/$_primaryName/${LibraryPage.pageName}';
  static String amazingAppsPath() =>
      '/$_primaryName/${AmazingApps.pageName}';
  static String aboutUsPath() => '/$_primaryName/${AboutUsPage.pageName}';
}
