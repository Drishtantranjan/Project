import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dashboard/presentation/overview/nav.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import '../assets.dart';

import 'batch/main.dart';
import 'bottom_bar.dart';
import 'chats/main.dart';
import 'courses/main.dart';
import 'home/main.dart';
import 'lazy_widget.dart';
import 'page_state.dart';
import 'provider.dart';
import 'shop/main.dart';

class DashboardOverviewPage extends HookConsumerWidget {
  const DashboardOverviewPage({super.key});

  static String get pageName => 'overview';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    final controller = useTabController(initialLength: 5, initialIndex: page);
    final user = AuthBox.useUser();
    final pageConfigs = useMemoized(() => [
          PageConfig(
            text: 'Home',
            page: PageState.home,
            iconSize: 24,
            iconBuilder: (c) => imageAsset(AssetProvider.homeNavIcon, color: c),
            builder: (controller) => DashboardHome(controller: controller),
          ),
          PageConfig(
            text: 'Batch',
            page: PageState.batch,
            iconSize: 34,
            iconBuilder: (c) =>
                imageAsset(AssetProvider.batchNavIcon, color: c),
            builder: (controller) => DashboardBatch(controller: controller),
          ),
          PageConfig(
            text: 'Courses',
            page: PageState.courses,
            iconSize: 28,
            iconBuilder: (c) =>
                imageAsset(AssetProvider.coursesNavIcon, color: c),
            builder: (controller) => DashboardCourses(controller: controller),
          ),
          PageConfig(
            text: 'Shop',
            page: PageState.shop,
            iconSize: 24,
            iconBuilder: (c) => imageAsset(AssetProvider.shopNavIcon, color: c),
            builder: (controller) => DashboardShop(controller: controller),
          ),
          PageConfig(
            text: 'Chats',
            page: PageState.chats,
            iconSize: 24,
            iconBuilder: (c) =>
                imageAsset(AssetProvider.chatsNavIcon, color: c),
            builder: (controller) => DashboardChats(controller: controller),
          ),
        ]);

    updatePageProvider() {
      ref.read(pageProvider.notifier).setIndex(controller.index);
    }

    useEffect(() {
      controller.index = page;
      return () {};
    }, [page]);

    useEffect(() {
      controller.addListener(updatePageProvider);
      return () => controller.removeListener(updatePageProvider);
    }, [controller]);

    // useEffect(() {
    //   Future.delayed(const Duration(milliseconds: 400)).then((value) => showDialog(context: context, builder: (c) => CustomDialog(
    //     title: "Update Profile",
    //     subtitle: "Add your profile details",
    //     actionPositiveLabel: "Update Profile",
    //     actionNegativeLabel: "Later",
    //     actionNegative: () => c.pop(),
    //     actionPositive: () {
    //       context.push(ProfileRoutes.addPath());
    //     },
    //   )));
    // }, []);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkSecondaryStatusBar,
      child: Scaffold(
        drawer: HomeDrawer(user: user.value, onLogout: () => user.value = null),
        body: SafeArea(child: LazyWidget(pageConfigs: pageConfigs, page: page)),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: defaultWhiteColor, boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, -4),
              )
            ]),
            child: BottomTabBar(
              controller: controller,
              pages: pageConfigs,
            ),
          ),
        ),
      ),
    );
  }
}
