import 'package:dashboard/presentation/overview/home/banner/main.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/home/schedule/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common.dart';

class TeacherDashboardHome extends HookConsumerWidget {
  const TeacherDashboardHome({
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
        CommonHomeAppBar(),
        const SliverList(
          delegate: SliverChildListDelegate.fixed([
            Schedule(),
            SizedBox(height: 24.5),
            CommonDivider(),
            SizedBox(height: 5.5),
            TeacherBanner(),
          ]),
        ),
      ],
    );
  }
}
