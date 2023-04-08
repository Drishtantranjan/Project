import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:dashboard/presentation/button.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import 'chip.dart';

class LibraryBanner extends StatelessWidget {
  const LibraryBanner({super.key});

  Widget _buildLibraryImage(String asset) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: imageAsset(
        asset,
        width: 50,
        height: 70,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 200),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: defaultWhiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withAlpha(25),
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategoryChip(text: "Library"),
                const MaxHeight(8),
                const Text("We've a Bookstore Here")
                    .titleLarge(color: defaultBlackColor),
                LinkButton(onPressed: () {}, label: "Download Now")
              ],
            ),
          ),
          Flexible(
            flex: 6,
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 145,
                width: 115,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 5,
                      child: _buildLibraryImage(AssetProvider.library01),
                    ),
                    Positioned(
                      top: 0,
                      left: 60,
                      child: _buildLibraryImage(AssetProvider.library02),
                    ),
                    Positioned(
                      top: 75,
                      left: 0,
                      child: _buildLibraryImage(AssetProvider.library03),
                    ),
                    Positioned(
                      top: 75,
                      left: 55,
                      child: _buildLibraryImage(AssetProvider.library04),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
