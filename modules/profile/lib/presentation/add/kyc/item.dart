import 'package:flutter/material.dart';

import 'package:profile/presentation/add/provider.dart';
import 'package:styles/styles.dart';

class KYCItem extends StatelessWidget {
  const KYCItem({super.key, required this.title, required this.status});

  final String title;
  final ProfileKycStatusEnum status;

  String get statusText {
    switch (status) {
      case ProfileKycStatusEnum.pendingValidation:
        return "Pending Validation";
      case ProfileKycStatusEnum.validated:
        return "Validated";
      case ProfileKycStatusEnum.rejectedValidation:
        return "Rejected";
      case ProfileKycStatusEnum.uploadFailed:
        return "Upload Failed";
      case ProfileKycStatusEnum.uploadPending:
        return "Upload Pending";
    }
  }

  Color get color {
    switch (status) {
      case ProfileKycStatusEnum.pendingValidation:
        return highlightColor;
      case ProfileKycStatusEnum.validated:
        return greenColor;
      case ProfileKycStatusEnum.rejectedValidation:
        return redColor;
      case ProfileKycStatusEnum.uploadFailed:
        return highlightColor;
      case ProfileKycStatusEnum.uploadPending:
        return redColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: defaultLightGreyColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title).labelLarge(color: defaultBlackColor),
              const SizedBox(height: 5),
              Container(
                // height: 28,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: defaultWhiteColor,
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(statusText).bodyMedium(color: color),
              ),
            ],
          ),
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: grey99Color,
            ),
            child: const Icon(
              Icons.arrow_right_sharp,
              color: defaultDarkGreyColor,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
