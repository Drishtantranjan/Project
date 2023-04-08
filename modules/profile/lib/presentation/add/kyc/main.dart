import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';
import 'package:routes/modules/profile.dart';
import 'package:styles/styles.dart';

import 'item.dart';

class ProfileAddKYC extends ConsumerWidget {
  const ProfileAddKYC({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kycData = ref.watch(kycDataProvider);
    final kycList = [
      kycData.aadhar,
      kycData.pan,
      kycData.address,
      kycData.other,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("KYC Verification").titleMedium(color: defaultBlackColor),
        const SizedBox(height: 13),
        const Text(
                "Upon uploading your KYC details, our team will validate your documents and update your KYC verfication status under profile section.")
            .bodyMedium(color: defaultDarkGreyColor),
        const SizedBox(height: 29),
        KYCItem(title: kycList[0].title, status: kycList[0].status),
        const SizedBox(height: 11),
        KYCItem(title: kycList[1].title, status: kycList[1].status),
        const SizedBox(height: 11),
        KYCItem(title: kycList[2].title, status: kycList[2].status),
        const SizedBox(height: 11),
        KYCItem(title: kycList[3].title, status: kycList[3].status),
        const SizedBox(height: 25),
        NextButton(onNext: () {
          context.pop();
          context.push(ProfileRoutes.viewPath());
        }),
      ],
    );
  }
}
