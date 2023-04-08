import 'package:flutter/material.dart';

import 'package:dashboard/data/model/course.dart';
import 'package:dashboard/presentation/button.dart';
import 'package:dashboard/presentation/overview/home/popular/item.dart';
import 'package:dashboard/presentation/overview/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styles/styles.dart';

class PopularCourses extends ConsumerWidget {
  const PopularCourses({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Popular Courses').titleLarge(color: defaultBlackColor),
              LinkButton(onPressed: () {
                ref.read(pageProvider.notifier).setIndex(2);
                ref.read(coursesTabProvider.notifier).setRight();
              }, label: "See all"),
            ],
          ),
        ),
        SizedBox(
          height: 322,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: courses.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CourseItem(course: courses[index]),
          ),
        ),
      ],
    );
  }
}