import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styles/styles.dart';

import 'banner.dart';
import 'search_box.dart';

class TopBox extends HookConsumerWidget {
  const TopBox({
    super.key,
    required this.height,
  });

  final double height;
  final String _keyPrefix = 'top_box';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      key: PageStorageKey('${_keyPrefix}_sliver_list'),
      delegate: SliverChildListDelegate([
        Stack(
          children: [
            Positioned(
              top: height,
              left: 0,
              right: 0,
              child: Container(
                height: 365,
                color: defaultWhiteColor,
              ),
            ),
            Positioned(
              child: Column(
                children: const [
                  SizedBox(height: 24.84),
                  SearchBox(),
                  SizedBox(height: 21.23),
                  HomeBanner(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
