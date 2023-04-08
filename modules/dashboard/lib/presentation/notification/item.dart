import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: defaultWhiteColor,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Qu'ran Batch A")
                      .labelLarge(color: secondaryColor),
                  const Spacer(),
                  const Text("04:15 AM")
                      .bodyMedium(color: defaultDarkGreyColor),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod")
                  .bodyLarge(color: defaultBlackColor),
            ],
          ),
        ),
      ),
    );
  }
}

class BadgeChip extends StatelessWidget {
  const BadgeChip({super.key, required this.text, this.showBadge = false});

  final String text;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 24, bottom: 4),
      child: Row(
        children: [
          Text(text).titleMedium(color: defaultBlackColor),
          if (showBadge)
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: greenColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
