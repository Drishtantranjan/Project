import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class AboutItem extends StatelessWidget {
  const AboutItem({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title).titleLarge(color: defaultBlackColor),
        const SizedBox(height: 17),
        Text(subtitle).bodyLarge(color: defaultDarkGreyColor),
      ],
    );
  }
}
