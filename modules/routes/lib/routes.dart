library routes;

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:routes/modules/courses.dart';
import 'package:shared/overlay.dart';
import 'package:shared/shared.dart';

import 'modules/auth.dart';
import 'modules/dashboard.dart';
import 'modules/docs.dart';
import 'modules/profile.dart';

export 'modules/auth.dart' show AuthRoutes;
export 'modules/dashboard.dart' show DashboardRoutes;
export 'modules/docs.dart' show DocsRoutes;
export 'modules/profile.dart' show ProfileRoutes;
export 'modules/courses.dart' show CoursesRoutes;
export 'di/injector.dart' show DIInjector;
export 'di/initialise.dart' show injectors;
export 'data/auth/hive.dart';

class RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    OverlayManager.clear();
  }
}

final routerConfig = GoRouter(
  observers: [
    RouteObserver(),
  ],
  errorBuilder: (context, state) => AnnotatedRegion(
    value: fullLightStatusBar,
    child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Error occurred"),
            TextButton(
              onPressed: () => context.go(AuthRoutes.gatewayPath()),
              child: const Text("Take me Home"),
            ),
          ],
        ),
      ),
    ),
  ),
  initialLocation: AuthRoutes.gatewayPath(),
  routes: [
    ...AuthRoutes.routes,
    ...DocsRoutes.routes,
    ...DashboardRoutes.routes,
    ...ProfileRoutes.routes,
    ...CoursesRoutes.routes,
  ],
);
