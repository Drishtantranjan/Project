import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:styles/styles.dart';

class SearchItem extends StatelessWidget {
  const SearchItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.onTap});

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: defaultWhiteColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: imageAsset(image, size: 40),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title).titleMedium(color: defaultBlackColor),
                    // const SizedBox(height: 4),
                    Text(subtitle).bodyMedium(color: defaultBlackColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
