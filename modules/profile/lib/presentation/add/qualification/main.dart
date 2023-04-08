// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/qualification/item.dart';
import 'package:profile/presentation/assets.dart';
import 'package:styles/styles.dart';

import '../provider.dart';

class ProfileAddQualification extends HookConsumerWidget {
  const ProfileAddQualification({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height - 270;
    final remainingHeight = height - 261;
    final padding = remainingHeight / 2 - 28;

    final qualificationList = ref.watch(qualificationDataProvider);

    final atleastOneFilled = qualificationList.isNotEmpty;

    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add Qualification").titleMedium(color: defaultBlackColor),
          if (qualificationList.isNotEmpty) const SizedBox(height: 18),
          if (qualificationList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: qualificationList.length,
                itemBuilder: (context, index) {
                  return QualificationDetailItem(
                    details: qualificationList[index],
                  );
                },
              ),
            ),
          if (qualificationList.isEmpty) SizedBox(height: padding),
          if (qualificationList.isEmpty)
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 261,
              child: Column(
                children: [
                  imageAsset(AssetProvider.noFiles, size: 200),
                  const SizedBox(height: 7),
                  const Text("There is nothing added to show")
                      .labelLarge(color: defaultDarkGreyColor),
                  const SizedBox(height: 5),
                  const Text("Please add your Qualification details")
                      .bodyMedium(color: defaultDarkGreyColor),
                ],
              ),
            ),
          if (atleastOneFilled) const SizedBox(height: 26),
          if (atleastOneFilled)
            NextButton(onNext: () {
              ref.read(pageDataProvider.notifier).setQualificationData(qualificationList);
              ref.read(pageDataProvider.notifier).setKYC();
            })
        ],
      ),
    );
  }
}
