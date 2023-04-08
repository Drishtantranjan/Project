// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:dashboard/presentation/button.dart';
import 'package:dashboard/presentation/overview/app_bar.dart';
import 'package:dashboard/presentation/overview/batch/add_batch.dart';
import 'package:dashboard/presentation/overview/batch/item.dart';
import 'package:dashboard/presentation/overview/container.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/data/auth/hive.dart';
import 'package:routes/modules/dashboard.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class DashboardBatch extends HookWidget {
  DashboardBatch({super.key, required this.controller});

  final _bucket = PageStorageBucket();

  static const _keyPrefix = 'dashboard_batch';

  final _customScrollPageKey =
      const PageStorageKey('${_keyPrefix}_custom_scroll_view');

  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    final currentUser = user.value;
    final canAddBatch = currentUser?.role == UserRole.admin ||
        currentUser?.role == UserRole.student;
    return PageStorage(
      bucket: _bucket,
      child: !canAddBatch
          ? _MainScrollContainer(
              pageKey: _customScrollPageKey,
              controller: controller,
            )
          : Stack(
              children: [
                _MainScrollContainer(
                  pageKey: _customScrollPageKey,
                  controller: controller,
                ),
                Positioned(
                  right: 18,
                  bottom: 29,
                  child: FloatingActionButton(
                    onPressed: () {
                      showHandleBarBottomSheet(
                        builder: (context) => const AddBatchBottomSheet(),
                        context: context,
                        height: 311,
                      );
                    },
                    shape: const CircleBorder(),
                    backgroundColor: secondaryColor15,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
    );
  }
}

class _MainScrollContainer extends HookWidget {
  _MainScrollContainer({
    required this.pageKey,
    required this.controller,
  });

  final PageStorageKey<String> pageKey;
  final ScrollController controller;
  final List<BatchItem> children = [
    const BatchItem(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    return CustomScrollView(
      key: pageKey,
      controller: controller,
      slivers: [
        const OverviewAppbar(title: "Batches"),
        if (user.value == null)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  NotLoggedInContainer(),
                ]),
          ),
        if (children.isNotEmpty && user.value != null)
          SliverPadding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 17),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => children[index],
                childCount: children.length,
              ),
            ),
          ),
        if (user.value?.role == UserRole.student)
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
            sliver: SliverList(
              delegate:
                  SliverChildListDelegate.fixed([_RequestBatchContainer()]),
            ),
          ),
      ],
    );
  }
}

class _RequestBatchContainer extends StatelessWidget {
  const _RequestBatchContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: defaultWhiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: defaultLightGreyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Request to join a batch')
                      .labelLarge(color: defaultBlackColor),
                  const SizedBox(height: 9),
                  const Text('Request your tutor to add you in a batch')
                      .bodyMedium(color: defaultDarkGreyColor),
                  const SizedBox(height: 12),
                  OutlinedPlainButton(
                      onPressed: () {
                        context.push(DashboardRoutes.requestBatchPath());
                      },
                      label: 'Send Join Request'),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: imageAsset(
                AssetProvider.requestBatch,
                size: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
