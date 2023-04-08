import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/courses/main/common.dart';
import 'package:dashboard/presentation/overview/courses/price_course.dart';

class GuestCourses extends StatelessWidget {
  const GuestCourses(
      {super.key, required this.controller, required this.pageKey});

  final ScrollController controller;
  final PageStorageKey<String> pageKey;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      key: pageKey,
      controller: controller,
      slivers: [
        const CommonCoursesAppBar(),
        CommonCoursesContainer(
          left: CommonCourseList(
            itemCount: 10,
            hasSearch: true,
            itemBuilder: (context, index) => const PriceCourse(
              banner:
                  "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
              title: 'Excepteur Sint Occaecat Conrei',
              category: "Qu'ran",
              discount: "60%",
              discountPrice: "999",
              originalPrice: "3000",
              rating: "4.5",
            ),
          ),
        )
      ],
    );
  }
}
