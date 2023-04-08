import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem(
      {super.key,
      required this.course,
      required this.name,
      required this.time});

  final String course;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19),
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Positioned(
                top: 55,
                left: 22,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                )),
            Positioned(
              left: 48,
              right: 0,
              bottom: 0,
              child: Container(
                  height: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                decoration: BoxDecoration(
                  color: grey99Color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(course).bodyMedium(color: primaryColor),
                    const SizedBox(height: 5),
                    Text(name).labelLarge(color: defaultBlackColor),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: defaultDarkGreyColor, size: 18),
                        const SizedBox(width: 10),
                        Text(time).bodyMedium(color: defaultDarkGreyColor),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 48,
              bottom: 0,
              child: Container(
                width: 8,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
