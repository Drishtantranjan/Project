import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class ProgressCourse extends StatelessWidget {
  const ProgressCourse({
    super.key,
    required this.banner,
    required this.title,
    required this.time,
    required this.progress,
  });

  final String banner;
  final String title;
  final String time;
  final double progress;

  factory ProgressCourse.dummy() => const ProgressCourse(
        banner:
            "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
        title: 'Excepteur Sint Occaecat Conrei',
        progress: 47,
        time: '35D 12H',
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 123,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: defaultLightGreyColor)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: imageAsset(
                      banner,
                      width: 85,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 21),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title).titleMedium(color: defaultBlackColor),
                        Text.rich(
                          TextSpan(
                            text: 'Time Left: ',
                            style:
                                type.labelSmall!.copyWith(color: primaryColor),
                            children: [
                              TextSpan(
                                text: time,
                                style: type.labelSmall!
                                    .copyWith(color: defaultDarkGreyColor),
                              ),
                            ],
                          ),
                        ),
                        AppProgressBar(
                          value: progress,
                          sliderPosition: SliderPosition.suffix,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
