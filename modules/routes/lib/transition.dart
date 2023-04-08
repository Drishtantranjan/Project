import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

GoRoute goRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
  String animType = "slide",
}) =>
    GoRoute(
        path: path,
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: builder(context, state),
            transitionDuration: const Duration(milliseconds: 150),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              switch (animType) {
                case "fade":
                  const begin = 0.0;
                  const end = 1.0;
                  final tween = Tween(begin: begin, end: end);
                  final opacityAnimation = animation.drive(tween);
                  return FadeTransition(
                    opacity: opacityAnimation,
                    child: child,
                  );
                default:
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end);
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
              }
            },
          );
        });
