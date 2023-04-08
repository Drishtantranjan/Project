import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

import 'common.dart';

class StudentDashboardHome extends HookConsumerWidget {
  const StudentDashboardHome({
    super.key,
    required this.controller,
    required this.scrollPageKey,
    required this.sliverListPageKey,
  });

  final ScrollController controller;
  final PageStorageKey<String> scrollPageKey;
  final PageStorageKey<String> sliverListPageKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      key: scrollPageKey,
      controller: controller,
      slivers: [
        CommonHomeAppBar(controller: controller),
        CommonTopBox(controller: controller),
        CommonListContainer(children: const [
          CommonContinueLearning(),
          CommonCategories(),
          CommonPopularCourses(),
          CommonLibraryBanner(),
          CommonReviews(),
          SizedBox(height: 35),
          CommonDivider(),
          SizedBox(height: 35),
          CommonBottomBox(),
          SizedBox(height: 67),
        ]),
      ],
    ).bgSecondaryColor15();
  }
}
