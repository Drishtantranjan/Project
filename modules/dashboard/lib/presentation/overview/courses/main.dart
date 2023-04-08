import 'package:flutter/material.dart';

import 'package:auth/auth.dart';
import 'package:dashboard/presentation/overview/courses/main/admin.dart';
import 'package:dashboard/presentation/overview/courses/main/guest.dart';
import 'package:dashboard/presentation/overview/courses/main/student.dart';
import 'package:dashboard/presentation/overview/courses/main/teacher.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routes/routes.dart';

class DashboardCourses extends HookWidget {
  DashboardCourses({super.key, required this.controller});

  final ScrollController controller;
  final _bucket = PageStorageBucket();

  static const _keyPrefix = 'dashboard_batch';

  final scrollPageKey = const PageStorageKey('${_keyPrefix}_scroll_view');

  Widget render(User? user) {
    if (user == null) {
      return GuestCourses(controller: controller, pageKey: scrollPageKey);
    } else if (user.role == UserRole.admin) {
      return AdminCourses(controller: controller, pageKey: scrollPageKey);
    } else if (user.role == UserRole.teacher) {
      return TeacherCourses(controller: controller, pageKey: scrollPageKey);
    } else {
      return StudentCourses(controller: controller, pageKey: scrollPageKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    return PageStorage(
      bucket: _bucket,
      child: render(user.value),
    );
  }
}