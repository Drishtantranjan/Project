import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/courses/hook.dart';
import 'package:dashboard/presentation/overview/courses/status_course.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class TeacherCourses extends HookConsumerWidget {
  const TeacherCourses(
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
          left: "Published Courses",
          right: "Draft Courses",
        ),
        CommonCoursesContainer(
          onTabChange: () => controller.jumpTo(0),
          controller: tabController,
          left: CommonCourseList(
            key: const PageStorageKey<String>("published"),
            itemCount: 10,
            hasSearch: true,
            searchLabel: "Search by course name",
            itemBuilder: (context, index) => StatusCourse.published(),
          ),
          right: CommonCourseList(
            key: const PageStorageKey<String>("draft"),
            itemCount: 10,
            hasSearch: false,
            itemBuilder: (context, index) => StatusCourse.draft(),
          ),
        ),
      ],
    );
  }
}
