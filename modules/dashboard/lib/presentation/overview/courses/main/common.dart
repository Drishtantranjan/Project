import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/app_bar.dart';
import 'package:dashboard/presentation/row.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styles/styles.dart';

class CommonCoursesAppBar extends StatelessWidget {
  const CommonCoursesAppBar(
      {super.key, this.controller, this.left, this.right});

  final TabController? controller;
  final String? left, right;

  @override
  Widget build(BuildContext context) {
    return OverviewAppbar(
      title: "Courses",
      bottom: controller != null
          ? TabBar(
              indicatorColor: defaultWhiteColor,
              indicatorWeight: 3,
              labelStyle: type.titleMedium,
              labelColor: defaultWhiteColor,
              unselectedLabelColor: defaultWhiteColor.withOpacity(0.3),
              controller: controller!,
              tabs: [Tab(text: left), Tab(text: right)],
            )
          : null,
    );
  }
}

class CommonCoursesContainer extends HookWidget {
  const CommonCoursesContainer(
      {super.key,
      this.controller,
      required this.left,
      this.right,
      this.onTabChange});

  final TabController? controller;
  final Widget left;
  final Widget? right;
  final VoidCallback? onTabChange;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (controller == null || onTabChange == null) return () {};
      listener() {
        onTabChange!();
      }

      controller!.addListener(listener);
      return () {
        controller!.removeListener(listener);
      };
    }, [controller]);
    return SliverFillRemaining(
      child:
          controller != null ? (controller!.index == 0 ? left : right!) : left,
    );
  }
}

class _CommonFilterSearchRow extends StatelessWidget {
  const _CommonFilterSearchRow({this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: FilterSearchRow(label: label),
    );
  }
}

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class CommonCourseList extends StatelessWidget {
  const CommonCourseList({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.hasSearch,
    this.onAdd,
    this.searchLabel,
  });

  final ItemBuilder itemBuilder;
  final int itemCount;
  final bool hasSearch;
  final VoidCallback? onAdd;
  final String? searchLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        hasSearch
            ? ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                shrinkWrap: true,
                itemCount: itemCount + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return _CommonFilterSearchRow(label: searchLabel);
                  return itemBuilder(context, index - 1);
                },
              )
            : ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: itemBuilder,
              ),
        if (onAdd != null)
          Positioned(
            bottom: 29,
            right: 18,
            child: FloatingActionButton(
              onPressed: onAdd,
              shape: const CircleBorder(),
              backgroundColor: secondaryColor15,
              child: const Icon(Icons.add),
            ),
          ),
      ],
    );
  }
}
