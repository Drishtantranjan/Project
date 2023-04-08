import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:styles/styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.controller, required this.category, required this.onRemoveCategory});

  final TextEditingController controller;

  final String? category;
  final VoidCallback onRemoveCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 15.28, right: 9.55),
      decoration: BoxDecoration(
        color: defaultWhiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: defaultLightGreyColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageAsset(
            AssetProvider.searchIcon,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          if (category != null)
            _CategoryChip(
              text: category!,
              onClose: onRemoveCategory,
            ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                fontSize: 21,
                height: 25.45 / 21,
                fontWeight: FontWeight.w400,
                color: defaultDarkGreyColor,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                isDense: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                // hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 21,
                  height: 24 / 21,
                  fontWeight: FontWeight.w400,
                  color: defaultDarkGreyColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Material(
            color: grey99Color,
            shape: const CircleBorder(),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: defaultDarkGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.text, required this.onClose});

  final String text;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 12, right: 5),
      decoration: BoxDecoration(
        color: secondaryColor90,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text).bodyMedium(color: blackColor),
          const SizedBox(width: 5),
          SizedBox(
            width: 20,
            height: 20,
            child: IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              onPressed: onClose,
              icon: const Icon(Icons.close, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
