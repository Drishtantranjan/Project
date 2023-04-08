import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class FilterSearchRow extends StatelessWidget {
  const FilterSearchRow({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _BorderedContainer(
          width: 100,
          height: 46,
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Filters').bodyLarge(color: defaultDarkGreyColor),
              const ConstraintFlexible(maxWidth: 13, minWidth: 1,),
              const Icon(Icons.filter_list,
                  color: defaultDarkGreyColor, size: 18)
            ],
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: _BorderedContainer(
            height: 46,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.search_rounded,
                      color: defaultDarkGreyColor, size: 20),
                  const ConstraintFlexible(maxWidth: 17, minWidth: 1,),
                  Text(label ?? 'looking for something')
                      .bodyLarge(color: defaultDarkGreyColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BorderedContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final VoidCallback onTap;

  const _BorderedContainer({
    required this.child,
    this.width = double.infinity,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: defaultLightGreyColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: defaultLightGreyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}
