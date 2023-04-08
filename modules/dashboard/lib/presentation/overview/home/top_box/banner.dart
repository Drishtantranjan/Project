import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:dashboard/presentation/overview/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

final _assets = [AssetProvider.banner01, AssetProvider.banner02];

class HomeBanner extends HookConsumerWidget {
  const HomeBanner({super.key});

  Widget _buildBanner(String asset, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: imageAsset(
              width: double.infinity,
              height: 200,
              asset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: _assets.length);

    return Column(
      children: [
        SizedBox(
          height: 199,
          child: TabBarView(
            controller: tabController,
            children: [
              _buildBanner(
                _assets[0],
                () {
                  ref.read(pageProvider.notifier).setIndex(2);
                  ref.read(coursesTabProvider.notifier).setRight();
                },
              ),
              _buildBanner(
                _assets[1],
                () {
                  ref.read(pageProvider.notifier).setIndex(1);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(child: CustomTabSelector(controller: tabController)),
      ],
    );
  }
}
