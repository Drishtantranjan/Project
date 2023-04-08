import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auth/presentation/assets.dart';
import 'package:auth/presentation/button.dart';
import 'package:auth/presentation/login/provider.dart';
import 'package:auth/presentation/wrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import 'tab.dart';

class WalkthroughPage extends HookConsumerWidget {

  const WalkthroughPage({super.key});

  static const pageName = 'walkthrough';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 3);
    final user = AuthBox.useUser();
    useEffect(() {
      Timer? timer;
      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
          controller.animateTo(controller.index == 2 ? 0 : controller.index + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        });
      });
      return () => timer?.cancel();
    }, []);

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Wrapper(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetProvider.image(AssetProvider.walkthroughBackground),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 300,
                  height: 374,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: const [
                      WalkthroughTab(
                        top: 100,
                        width: 240,
                        height: 145.71,
                        fit: BoxFit.cover,
                        asset: AssetProvider.walkthroughBanner1,
                        title: 'Welcome to Al-Abrish Islamic Academy',
                        subtitle: 'You go-to app for all learning needs.',
                      ),
                      WalkthroughTab(
                        top: 58,
                        width: 200,
                        height: 200,
                        asset: AssetProvider.walkthroughBanner2,
                        title: 'Structured Content',
                        subtitle:
                            'Access study material that is structured to help you succeed',
                      ),
                      WalkthroughTab(
                        top: 58,
                        width: 200,
                        height: 200,
                        asset: AssetProvider.walkthroughBanner3,
                        title: "It's all about Communication",
                        subtitle:
                            'Stay connected 24x7 directly\nusing out chat feature.',
                      ),
                    ],
                  ),
                ),
                const ConstraintFlexible(maxHeight: 48, minHeight: 10),
                CustomTabSelector(controller: controller),
                const ConstraintFlexible(maxHeight: 55, minHeight: 10),
                RoundedButton(
                  onPressed: () {
                    ref.read(roleProvider.notifier).setStudentRole();
                    context.go(AuthRoutes.loginPath());
                  },
                  text: 'Get Started',
                ),
                TextButton(
                  onPressed: () {
                    user.value = null;
                    context.go(DashboardRoutes.overviewPath());
                  },
                  child: const Text('Explore as Guest')
                      .bodyLarge(color: secondaryColor15),
                ),
                const ConstraintFlexible(maxHeight: 40, minHeight: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
