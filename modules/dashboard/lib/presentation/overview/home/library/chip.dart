import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 28,
      width: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: grey99Color,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ).labelMedium(color: defaultDarkGreyColor),
    );
  }
}
