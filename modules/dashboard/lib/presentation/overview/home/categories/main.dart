import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

import 'chip.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Text('Categories').titleLarge(color: defaultBlackColor),
        ),
        const SizedBox(height: 13),
        SizedBox(
          height: 42,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              const child = CategoryChip(image: "https://i.ibb.co/vd9Ntk0/ic.png", label: "English");
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: child,
                );
              } else if (index == 3 - 1) {
                return const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: child,
                );
              } else {
                return child;
              }
            },
            separatorBuilder: (context, index) => const SizedBox(width: 14),
          ),
        )
      ],
    );
  }
}