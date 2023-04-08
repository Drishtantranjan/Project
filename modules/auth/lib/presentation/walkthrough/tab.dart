import 'package:flutter/material.dart';

import 'package:auth/presentation/assets.dart';
import 'package:styles/styles.dart';

class WalkthroughTab extends StatelessWidget {
  const WalkthroughTab({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
    this.top,
    this.width,
    this.height,
    this.fit,
  });

  final String asset;
  final double? top;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          imageAsset(
            asset,
            width: width,
            height: height,
            fit: fit,
          ),
          const SizedBox(height: 80),
          Text(title).alignCenter().titleLarge(color: secondaryColor15),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(subtitle)
                .alignCenter()
                .bodyLarge(color: defaultDarkGreyColor),
          ),
        ],
      ),
    );
  }
}
