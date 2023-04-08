import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:styles/styles.dart';

class DashboardShop extends StatelessWidget {
  DashboardShop({super.key, required this.controller});

  final ScrollController controller;

  final _bucket = PageStorageBucket();

  static const _keyPrefix = 'dashboard_shop';

  final _customScrollPageKey =
      const PageStorageKey('${_keyPrefix}_custom_scroll_view');

  Widget tile({int index = 0}) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: imageAsset(
              "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          child: const Text('Shopper.com').bodyMedium(color: defaultWhiteColor),
        ),
      ],
    );
  }

  double _computeMainAxisCount(int index) {
    if (index == 0) return 1;
    if (index == 1) return 2;
    if (index == 2) return 2;
    if (index == 3) return 1;
    if (index % 4 == 0) return 1;
    if ((index + 1) % 4 == 0) return 1;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,
      child: CustomScrollView(
        key: _customScrollPageKey,
        controller: controller,
        slivers: [
          const OverviewAppbar(
            title: "Shop",
          ),
          SliverFillRemaining(
            child: StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(14),
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              itemBuilder: (context, index) => tile(index: index),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(1, _computeMainAxisCount(index)),
            ),
          ),
        ],
      ),
    );
  }
}
