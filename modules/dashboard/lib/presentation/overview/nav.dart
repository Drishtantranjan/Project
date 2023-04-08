import 'package:dashboard/presentation/overview/provider.dart';
import 'package:flutter/material.dart';

import 'package:auth/auth.dart';
import 'package:dashboard/presentation/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class HomeDrawer extends HookWidget {
  const HomeDrawer({super.key, required this.user, required this.onLogout});

  final User? user;
  final VoidCallback onLogout;

  double _minHeight(User? user) {
    if (user == null) return 300;
    if (user.role == UserRole.student) return 750;
    return 630;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final doScroll = height <= _minHeight(user);

    return SafeArea(
      child: Drawer(
        child: doScroll
            ? Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: _NavContainer(
                          user: user, onLogout: onLogout, doScroll: doScroll),
                    ),
                  ),
                ],
              )
            : _NavContainer(user: user, onLogout: onLogout, doScroll: doScroll),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.title,
    required this.asset,
    required this.onTap,
    required this.show,
  });

  final String title;
  final String asset;
  final VoidCallback onTap;
  final bool show;

  @override
  Widget build(BuildContext context) {
    if (!show) return Container();
    return ListTile(
      leading: imageAsset(
        asset,
        size: 24,
        color: defaultDarkGreyColor,
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      minLeadingWidth: 25,
      title: Text(title).labelLarge(color: defaultDarkGreyColor),
      onTap: onTap,
    );
  }
}

class _NavContainer extends ConsumerWidget {
  const _NavContainer(
      {required this.user, required this.onLogout, required this.doScroll});
  final User? user;
  final bool doScroll;
  final VoidCallback onLogout;

  void doAction(BuildContext context, WidgetRef ref) {
    Scaffold.of(context).closeDrawer();
    onLogout();
    context.go(AuthRoutes.walkthroughPath());
    ref.read(pageProvider.notifier).setIndex(0);
    ref.read(coursesTabProvider.notifier).setLeft();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = user;
    final isGuest = currentUser == null;
    final isStudent = !isGuest && currentUser.role == UserRole.student;
    final isTeacher = !isGuest && currentUser.role == UserRole.teacher;
    final isAdmin = !isGuest && currentUser.role == UserRole.admin;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: defaultWhiteColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  if (isGuest) {
                    doAction(context, ref);
                  } else {
                    context.push(ProfileRoutes.addPath());
                  }
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: defaultDarkGreyColor.withOpacity(0.3), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: imageAsset(
                            currentUser?.photoUrl ?? AssetProvider.guestDp,
                            size: 50,
                            color: defaultDarkGreyColor,
                            fallbackAsset: AssetProvider.guestDp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user?.name ?? "Guest User",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1)
                                .titleMedium(color: defaultBlackColor),
                            if (!isGuest)
                              const Text('view profile')
                                  .labelLarge(color: primaryColor)
                            else
                              const Text('Login Please')
                                  .titleMedium(color: defaultDarkGreyColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 12),
            child:
                const Text('Options').labelLarge(color: defaultDarkGreyColor),
          ),
          _NavItem(
            title: 'Course Certificate',
            asset: AssetProvider.courseCertificateSidebarIcon,
            onTap: () {},
            show: isStudent,
          ),
          _NavItem(
            title: 'Daily Activities',
            asset: AssetProvider.dailyActivitiesSidebarIcon,
            onTap: () {},
            show: isStudent,
          ),
          _NavItem(
            title: 'Payments',
            asset: AssetProvider.paymentsSidebarIcon,
            onTap: () {},
            show: isStudent,
          ),
          _NavItem(
            title: 'Library',
            asset: AssetProvider.librarySidebarIcon,
            onTap: () {
              context.push(DashboardRoutes.libraryPath());
            },
            show: true,
          ),
          _NavItem(
            title: 'Daily Islamic Remainder',
            asset: AssetProvider.dailyRemaindersSidebarIcon,
            onTap: () {},
            show: !isGuest,
          ),
          _NavItem(
            title: 'Amazing Islamic Apps',
            asset: AssetProvider.appsSidebarIcon,
            onTap: () {
              context.push(DashboardRoutes.amazingAppsPath());
            },
            show: !isGuest,
          ),
          _NavItem(
            title: 'About us',
            asset: AssetProvider.aboutSidebarIcon,
            onTap: () {
              context.push(DashboardRoutes.aboutUsPath());
            },
            show: true,
          ),
          _NavItem(
            title: 'Settings',
            asset: AssetProvider.settingsSidebarIcon,
            onTap: () {},
            show: isTeacher || isAdmin || isGuest,
          ),
          if (!doScroll)
            Expanded(child: Container())
          else
            const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: SecondaryButton(
              labelText: currentUser == null ? "Login" : "Logout",
              onPressed: () {
                doAction(context, ref);
              },
            ),
          ),
          const SizedBox(height: 16),
          if (!isGuest)
            SizedBox(
              width: double.infinity,
              child: SecondaryLinkButton(
                label: "Privacy Policy",
                onPressed: () {},
              ),
            ),
          if (!doScroll)
            const SizedBox(height: 40)
          else
            const SizedBox(height: 16),
        ],
      ),
    );
  }
}
