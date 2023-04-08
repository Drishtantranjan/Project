import 'package:dashboard/data/model/course.dart';
import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    super.key,
    required this.course,
  });

  final Course course;

  String formatDate(int duration) {
    final int hours = duration ~/ 60;
    final int minutes = duration % 60;
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 17, top: 10),
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.15),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Material(
          color: defaultWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  padding: const EdgeInsets.only(
                      top: 14, left: 15, right: 15, bottom: 10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageAsset(course.image,
                            height: 180, fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 11,
                        left: 16,
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: defaultWhiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: blackColor.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 18,
                              ),
                              Text(
                                "${course.rating}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 22 / 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 19),
                  width: 190,
                  child: Text(course.title)
                      .titleMedium(color: defaultBlackColor),
                ),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Text(
                          "${course.moduleCount} module${course.moduleCount > 1 ? 's' : ''} · ${formatDate(course.duration)}")
                      .bodyMedium(color: defaultDarkGreyColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
