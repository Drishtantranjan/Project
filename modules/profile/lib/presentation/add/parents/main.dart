// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';
import 'package:shared/bottom_sheet.dart';
import 'package:styles/styles.dart';

import 'bottom_sheet.dart';
import 'item.dart';

class ProfileAddParents extends HookConsumerWidget {
  const ProfileAddParents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentDetails = ref.watch(parentsDataProvider);
    final fatherDetails = parentDetails?.father;
    final motherDetails = parentDetails?.mother;
    final guardianDetails = parentDetails?.guardian;

    
    final atleastOneToBeFilled = [fatherDetails, motherDetails, guardianDetails]
        .any((element) => element == null);
    final atleastOneFilled = [fatherDetails, motherDetails, guardianDetails]
        .any((element) => element != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Parent Information").titleMedium(color: defaultBlackColor),
        if (atleastOneToBeFilled) const SizedBox(height: 9),
        if (fatherDetails == null)
          AddLinkButton(
              label: "Add Father Details",
              onPressed: () async {
                final value = await showHandleBarBottomSheet(
                    context: context,
                    height: 740,
                    builder: (context) => ParentDetailsUpdateBottomSheet(
                          parent: Parent.father,
                          details: fatherDetails,
                        ));

                ref.read(pageDataProvider.notifier).setParentsData(
                    ProfileParentsAddData(
                        father: value,
                        mother: motherDetails,
                        guardian: guardianDetails));
              }),
        if (motherDetails == null)
          AddLinkButton(
              label: "Add Mother Details",
              onPressed: () async {
                final value = await showHandleBarBottomSheet(
                    context: context,
                    height: 740,
                    builder: (context) => ParentDetailsUpdateBottomSheet(
                          parent: Parent.mother,
                          details: motherDetails,
                        ));
                ref.read(pageDataProvider.notifier).setParentsData(
                    ProfileParentsAddData(
                        father: fatherDetails,
                        mother: value,
                        guardian: guardianDetails));
              }),
        if (guardianDetails == null)
          AddLinkButton(
              label: "Add Guardian Details",
              onPressed: () async {
                final value = await showHandleBarBottomSheet(
                    context: context,
                    height: 740,
                    builder: (context) => ParentDetailsUpdateBottomSheet(
                          parent: Parent.guardian,
                          details: guardianDetails,
                        ));

                ref.read(pageDataProvider.notifier).setParentsData(
                    ProfileParentsAddData(
                        father: fatherDetails,
                        mother: motherDetails,
                        guardian: value));
              }),
        if (atleastOneFilled) const SizedBox(height: 21),
        if (fatherDetails != null) ParentDetailItem(details: fatherDetails),
        if (motherDetails != null) ParentDetailItem(details: motherDetails),
        if (guardianDetails != null) ParentDetailItem(details: guardianDetails),
        if (atleastOneFilled) const SizedBox(height: 3),
        if (atleastOneFilled)
          NextButton(onNext: () {
            ref.read(pageDataProvider.notifier).setQualification();
          }),
      ],
    );
  }
}
