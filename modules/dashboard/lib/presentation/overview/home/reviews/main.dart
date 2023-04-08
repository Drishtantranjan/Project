import 'package:flutter/material.dart';

import 'package:dashboard/data/model/review.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

import 'item.dart';

class Reviews extends HookWidget {
  const Reviews({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: reviews.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Text('Reviews from Students')
              .titleLarge(color: defaultBlackColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Text('we care about your experience too.')
              .bodyLarge(color: defaultDarkGreyColor),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 200,
          child: TabBarView(
            controller: tabController,
            children:
                reviews.map((review) => ReviewItem(review: review)).toList(),
            // separatorBuilder: (context, index) => const SizedBox(width: 32),
          ),
        ),
        const SizedBox(height: 10),
        Center(child: CustomTabSelector(controller: tabController)),
      ],
    );
  }
}
