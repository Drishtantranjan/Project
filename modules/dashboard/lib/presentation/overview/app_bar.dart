import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class OverviewAppbar extends HookWidget {
  const OverviewAppbar({
    super.key,
    this.showIcon = true,
    this.title,
    this.bottom,
  });

  final PageStorageKey<String> _sliverAppBarPageKey =
      const PageStorageKey('sliverAppBarPageKey');
  final bool showIcon;
  final String? title;
  final PreferredSizeWidget? bottom;

  void onSearchPressed(GoRouter router) {
    router.push(DashboardRoutes.searchPath());
  }

  void onNotificationPressed(GoRouter router) {
    router.push(DashboardRoutes.notificationPath());
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    final currentUser = user.value;
    return SliverAppBar(
      titleSpacing: 8,
      leadingWidth: showIcon ? 65 : 75,
      backgroundColor: secondaryColor15,
      surfaceTintColor: secondaryColor15,
      foregroundColor: defaultWhiteColor,
      key: _sliverAppBarPageKey,
      elevation: showIcon ? 4 : 0,
      pinned: true,
      bottom: bottom,
      actions: [
        if (currentUser == null || currentUser.role == UserRole.student)
          AnimatedOpacity(
            opacity: showIcon ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: Tooltip(
              message: 'Search',
              child: SplashButton(
                child: imageAsset(
                  AssetProvider.searchIcon,
                  size: 33,
                  color: defaultWhiteColor,
                ),
                onPressed: () {
                  if (!showIcon) return;
                  onSearchPressed(GoRouter.of(context));
                },
              ),
            ),
          ),
        if (currentUser != null) const SizedBox(width: 5),
        if (currentUser != null)
          Tooltip(
            message: 'Notification',
            child: SplashButton(
              child: Center(
                child: Stack(
                  children: [
                    imageAsset(
                      AssetProvider.notificationIcon,
                      size: 33,
                      color: defaultWhiteColor,
                    ),
                    Positioned(
                      right: 3,
                      top: 5,
                      child: Container(
                        width: 9,
                        height: 9,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onPressed: () {
                onNotificationPressed(GoRouter.of(context));
              },
            ),
          ),
        const SizedBox(width: 10),
      ],
      leading: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: imageAsset(
                  user.value?.photoUrl ?? AssetProvider.guestDp,
                  size: showIcon ? 40 : 48,
                  fit: BoxFit.cover,
                  fallbackAsset: AssetProvider.guestDp,
                ),
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: 75,
      title: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: SizedBox(
          width: double.infinity,
          child: (title != null)
              ? Text(title!).titleLarge(color: defaultWhiteColor)
              : AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showIcon)
                        const Text('Assalamualaykum!!')
                            .bodySmall(color: defaultWhiteColor)
                      else
                        const Text('Assalamualaykum!!')
                            .bodyMedium(color: defaultWhiteColor),
                      if (showIcon)
                        Text(user.value?.name ?? "Guest User")
                            .titleMedium(color: defaultWhiteColor)
                      else
                        Text(user.value?.name ?? "Guest User")
                            .titleLarge(color: defaultWhiteColor),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
