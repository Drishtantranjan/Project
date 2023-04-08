import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/modules/dashboard.dart';
import 'package:styles/styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.image,
    required this.label,
  });

  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Material(
        color: defaultWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: defaultLightGreyColor),
        ),
        child: InkWell(
          onTap: () {
            context.push(DashboardRoutes.searchPath(), extra: label);
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: imageAsset(image, height: 21, width: 21),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 17),
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 19.41 / 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
