import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class AuthGatewayPage extends HiveBoxInitiator {
  static const pageName = 'gateway';
  const AuthGatewayPage({super.key});
  @override
  Widget createWidget(BuildContext context) => const _AuthGateWayState();

  @override
  Future<void> initHiveBoxes() {
    return hiveBoxInit(AuthBox.boxName);
  }
}

class _AuthGateWayState extends HookWidget {
  const _AuthGateWayState();

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    useEffect(() {
      if (user.value != null) {
        Future.delayed(const Duration(milliseconds: 100), () {
          final router = GoRouter.of(context);
          router.go(DashboardRoutes.overviewPath());
        });
      }
      return () {};
    }, []);
    return (user.value == null)
        ? const _SplashLoading()
        : const _EmptyLoading();
  }
}

class _EmptyLoading extends StatelessWidget {
  const _EmptyLoading();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}

class _SplashLoading extends HookWidget {
  const _SplashLoading();

  @override
  Widget build(BuildContext context) {
    final expandController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    final opacity = useState(1.0);

    Animation<double> expandAnimation = useMemoized(
        () => CurvedAnimation(
              parent: expandController,
              curve: const Cubic(0.49, 0, 1, 0.41),
            ),
        [expandController]);

    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);

    final expandValue = useAnimation(expandAnimation);

    final radius = expandValue * (size.height + size.height / 4);

    useEffect(() {
      initExpand() async {
        await Future.delayed(const Duration(milliseconds: 200));
        await expandController.forward();
        opacity.value = 0.2;
      }

      initExpand();
      return () {};
    }, []);

    useEffect(() {
      if (opacity.value > 0.2) return () {};
      Future.delayed(const Duration(milliseconds: 0), () {
        router.go(AuthRoutes.walkthroughPath());
      });
      return () {};
    }, [opacity.value]);

    return AnnotatedRegion(
      value: systemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: opacity.value,
          curve: Curves.easeOut,
          child: Container(
            color: expandValue >= 0.9 ? primaryColor : Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              size: const Size(double.infinity, double.infinity),
              painter: _CirclePainter(radius),
            ),
          ),
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double radius;
  final circlePaint = Paint()
    ..color = primaryColor
    ..style = PaintingStyle.fill;

  final rRectPaint = Paint()
    ..color = primaryColor.withOpacity(0.5)
    ..style = PaintingStyle.fill;

  _CirclePainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), radius, circlePaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2), radius: radius),
          const Radius.circular(50)),
      rRectPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
