import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:styles/styles.dart';

enum Status { published, draft }

class StatusCourse extends StatelessWidget {
  const StatusCourse({
    super.key,
    required this.banner,
    required this.category,
    required this.title,
    required this.status,
  });

  final String banner;
  final String category;
  final String title;
  final Status status;

  factory StatusCourse.published() => const StatusCourse(
        banner:
            "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
        category: "Qu'ran",
        title: "Excepteur Sint Occaecat faethuv",
        status: Status.published,
      );

  factory StatusCourse.draft() => const StatusCourse(
        banner:
            "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
        category: "Qu'ran",
        title: "Excepteur Sint Occaecat faethuv",
        status: Status.draft,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 106,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: defaultLightGreyColor)),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: imageAsset(
                          banner,
                          width: 90,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 22),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category).titleSmall(color: primaryColor),
                            const SizedBox(height: 4),
                            Text(title, maxLines: 2)
                                .titleMedium(color: defaultBlackColor),
                            const SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: status == Status.published
                            ? primaryColor
                            : highlightColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Text(status == Status.published
                              ? 'Published'
                              : 'Draft')
                          .labelSmall(color: defaultWhiteColor),
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
