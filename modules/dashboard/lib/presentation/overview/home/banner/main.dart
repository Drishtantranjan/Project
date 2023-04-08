import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class TeacherBanner extends StatelessWidget {
  const TeacherBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _Bordered(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const _Numbered(title: "Courses", number: "02"),
                imageAsset(AssetProvider.coursesTeacherBanner, height: 100),
              ],
            ),
          ),
          const SizedBox(height: 19),
          _Bordered(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                imageAsset(AssetProvider.batchesTeacherBanner, height: 100),
                const _Numbered(title: "Batches", number: "01"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Bordered extends StatelessWidget {
  const _Bordered({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: defaultWhiteColor,
        border: Border.all(color: defaultLightGreyColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class _Numbered extends StatelessWidget {
  const _Numbered({required this.title, required this.number});

  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title).bodyLarge(color: primaryColor),
          Text(number).displayMedium(color: primaryColor),
        ],
      ),
    );
  }
}
