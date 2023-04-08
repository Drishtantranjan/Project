import 'package:flutter/material.dart';

import 'package:dashboard/presentation/button.dart';
import 'package:dashboard/presentation/overview/home/learning/item.dart';
import 'package:dashboard/presentation/overview/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styles/styles.dart';

class ContinueLearning extends ConsumerWidget {
  const ContinueLearning({super.key});

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
              const Text('Continue Learning')
                  .titleLarge(color: defaultBlackColor),
              LinkButton(onPressed: () {
                ref.read(pageProvider.notifier).setIndex(2);
                ref.read(coursesTabProvider.notifier).setLeft();
              }, label: "See all"),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 170,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              const child = LearningItem();
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: child,
                );
              } else if (index == 2 - 1) {
                return const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: child,
                );
              } else {
                return child;
              }
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
          ),
        )
      ],
    );
  }
}
