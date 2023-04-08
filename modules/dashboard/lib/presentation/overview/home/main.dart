import 'package:dashboard/presentation/overview/home/main/student.dart';
import 'package:flutter/material.dart';

import 'package:auth/auth.dart';
import 'package:dashboard/presentation/overview/home/main/admin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';

import 'main/guest.dart';
import 'main/teacher.dart';

class DashboardHome extends HookConsumerWidget {
  DashboardHome({super.key, required this.controller});

  final ScrollController controller;

  final _bucket = PageStorageBucket();
  static const _keyPrefix = 'dashboard_home';
  final scrollPageKey =
      const PageStorageKey('${_keyPrefix}_custom_scroll_view');
  final sliverListPageKey =
      const PageStorageKey('${_keyPrefix}_sliver_categories');

  Widget _render(User? user) {
    if (user == null) {
      return GuestDashboardHome(
        controller: controller,
        scrollPageKey: scrollPageKey,
        sliverListPageKey: scrollPageKey,
      );
    } else if (user.role == UserRole.admin) {
      return AdminDashboardHome(
          controller: controller,
          scrollPageKey: scrollPageKey,
          sliverListPageKey: sliverListPageKey);
    } else if (user.role == UserRole.teacher) {
      return TeacherDashboardHome(
          controller: controller,
          scrollPageKey: scrollPageKey,
          sliverListPageKey: sliverListPageKey);
    } else {
      return StudentDashboardHome(
          controller: controller,
          scrollPageKey: scrollPageKey,
          sliverListPageKey: sliverListPageKey);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = AuthBox.useUser();

    return PageStorage(
      bucket: _bucket,
      child: _render(user.value),
    );
  }
}
