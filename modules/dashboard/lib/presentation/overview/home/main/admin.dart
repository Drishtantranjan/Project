import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:dashboard/presentation/button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styles/styles.dart';

import 'common.dart';

class AdminDashboardHome extends HookConsumerWidget {
  const AdminDashboardHome({
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
        CommonListContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 37),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _CircleChip(
                      asset: AssetProvider.paymentsIcon, label: "Payments"),
                  _CircleChip(asset: AssetProvider.libraryIcon, label: "Library"),
                  _CircleChip(asset: AssetProvider.coursesIcon, label: "Courses"),
                  _CircleChip(asset: AssetProvider.peopleIcon, label: "Batches"),
                ],
              ),
            ),
            const SizedBox(height: 36),
            const _CreateCoupon(),
            const SizedBox(height: 22),
            const _UsersListWidget(),
            const SizedBox(height: 22),
          ],
        ),
      ],
    );
  }
}

class _CircleChip extends StatelessWidget {
  const _CircleChip({
    required this.asset,
    required this.label,
  });

  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: imageAsset(asset, size: 28.8),
        ),
        const SizedBox(height: 5),
        Text(label).bodySmall(color: defaultBlackColor),
      ],
    );
  }
}

class _CreateCoupon extends StatelessWidget {
  const _CreateCoupon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageAsset(AssetProvider.couponSticker, height: 52),
          const SizedBox(width: 31),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Create Coupon").labelLarge(color: defaultBlackColor),
              const Text("Lorem ipsum dolor sit amet")
                  .bodySmall(color: defaultDarkGreyColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _UsersListWidget extends StatelessWidget {
  const _UsersListWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 27, bottom: 34, left: 18, right: 17),
      decoration: BoxDecoration(
        border: Border.all(color: defaultLightGreyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Users List").titleLarge(color: defaultBlackColor),
          const SizedBox(height: 6),
          const Text('All types of users are listed here.')
              .bodyMedium(color: defaultDarkGreyColor),
          const SizedBox(height: 9),
          LinkButton(
            onPressed: () {},
            label: "Add new user",
            style: type.bodyLarge,
          ),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _UserHint(
                userList: List.generate(
                    20, (index) => "https://i.ibb.co/KD9jZTk/dp.png"),
              ),
              const _ViewAllButton(),
            ],
          )
        ],
      ),
    );
  }
}

class _UserHint extends StatelessWidget {
  const _UserHint({
    required this.userList,
  });

  final List<String> userList;

  @override
  Widget build(BuildContext context) {
    final usersToShowImage = userList.take(4).toList();
    final remainingUsers = userList.skip(4).toList();
    return Row(
      children: [
        SizedBox(
          width: usersToShowImage.length * 26.0 + 22.0,
          height: 42,
          child: Stack(
            children: [
              for (var i = 0; i < usersToShowImage.length; i++)
                Positioned(
                  left: i * 26.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(color: defaultWhiteColor, width: 2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: imageAsset(usersToShowImage[i], height: 40),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Text("+ ${remainingUsers.length} more")
            .bodyMedium(color: defaultBlackColor),
      ],
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  const _ViewAllButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      // width: 110,
      constraints: const BoxConstraints(maxWidth: 110, minWidth: 50),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: defaultLightGreyColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("View all").labelMedium(color: defaultDarkGreyColor),
          const Icon(Icons.keyboard_arrow_right,
              size: 22, color: defaultDarkGreyColor),
        ],
      ),
    );
  }
}
