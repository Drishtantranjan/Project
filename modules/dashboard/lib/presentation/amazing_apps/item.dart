import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class AppItem extends StatelessWidget {
  const AppItem({super.key, required this.image, required this.appName});

  final String image;
  final String appName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 77,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: grey99Color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  left: 6,
                  right: 6,
                  top: 6,
                  bottom: 6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imageAsset(image, size: 48, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          Text(appName).mini(color: defaultBlackColor),
        ],
      ),
    );
  }
}
