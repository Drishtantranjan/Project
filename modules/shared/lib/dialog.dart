import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionPositiveLabel,
    required this.actionNegativeLabel,
    required this.actionPositive,
    required this.actionNegative,
  });

  final String title;
  final String subtitle;
  final String actionPositiveLabel;
  final String actionNegativeLabel;
  final VoidCallback actionPositive;
  final VoidCallback actionNegative;

  Widget _buildContent() {
    return SizedBox(
      height: 125,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title).titleLarge(color: defaultBlackColor),
          const SizedBox(height: 8),
          Text(subtitle).bodyLarge(color: defaultBlackColor),
        ],
      ),
    );
  }

  Widget _buildAction(String label, VoidCallback action) {
    return Material(
      color: defaultWhiteColor,
      child: InkWell(
        onTap: action,
        child: Container(
          height: 60,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: defaultLightGreyColor),
            ),
          ),
          child: Text(label).bodyLarge(color: const Color(0xFF1A83FF)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: defaultWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: defaultLightGreyColor),
      ),
      child: SizedBox(
        width: 320,
        height: 245,
        child: Column(
          children: [
            _buildContent(),
            _buildAction(actionPositiveLabel, actionPositive),
            _buildAction(actionNegativeLabel, actionNegative),
          ],
        ),
      ),
    );
  }
}
