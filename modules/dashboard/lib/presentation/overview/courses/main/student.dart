import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/courses/hook.dart';
import 'package:dashboard/presentation/overview/courses/price_course.dart';
import 'package:dashboard/presentation/overview/courses/progress_course.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class StudentCourses extends HookConsumerWidget {
  const StudentCourses(
      {super.key, required this.pageKey, required this.controller});

  final PageStorageKey<String> pageKey;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useCoursesTab(ref);
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      key: pageKey,
      controller: controller,
      slivers: [
        CommonCoursesAppBar(
          controller: tabController,
          left: "My Courses",
          right: "Purchase Courses",
        ),
        CommonCoursesContainer(
          onTabChange: () => controller.jumpTo(0),
          controller: tabController,
          left: CommonCourseList(
            key: const PageStorageKey<String>('my_courses'),
            itemCount: 10,
            hasSearch: false,
            itemBuilder: (context, index) => ProgressCourse.dummy(),
          ),
          right: CommonCourseList(
            key: const PageStorageKey<String>('purchase_courses'),
            itemCount: 10,
            hasSearch: true,
            itemBuilder: (context, index) => PriceCourse.dummy(),
          ),
        ),
      ],
    );
  }
}
