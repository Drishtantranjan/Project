import 'package:dashboard/presentation/assets.dart';
import 'package:dashboard/presentation/overview/home/util.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class LearningItem extends StatelessWidget {
  const LearningItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = computeSizeWithDimension(
      size: MediaQuery.of(context).size.width,
      padding: 16,
      initialSize: 365,
    );
    return SizedBox(
      height: 170,
      width: width,
      child: Material(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: defaultLightGreyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        color: defaultWhiteColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 110,
                  child: Column(
                    children: [
                      const Text("Excepteur Sint Occaecat Conrei", maxLines: 2, overflow: TextOverflow.ellipsis,)
                          .alignLeft()
                          .titleMedium(color: defaultBlackColor),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 22,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 64,
                              decoration: BoxDecoration(
                                color: primaryColor90,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: const Text("Courses")
                                  .labelSmall(color: primaryColor),
                            ),
                            const SizedBox(width: 11),
                            const Text("Time Left: ")
                                .bodySmall(color: primaryColor),
                            const Text("2h 30m")
                                .bodySmall(color: defaultDarkGreyColor),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imageAsset(
                      "https://images.pexels.com/photos/574071/pexels-photo-574071.jpeg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 19,
                  child: AppProgressBar(value: 47),
                ),
                Positioned(
                  bottom: 21,
                  left: 0,
                  child: const Text('Overall Progress')
                      .labelMedium(color: defaultDarkGreyColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
