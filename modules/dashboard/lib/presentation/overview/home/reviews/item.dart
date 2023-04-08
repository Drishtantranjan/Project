import 'package:flutter/material.dart';

import 'package:dashboard/data/model/review.dart';
import 'package:styles/styles.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 201,
        padding:
            const EdgeInsets.only(left: 22, right: 22, top: 20, bottom: 22),
        decoration: BoxDecoration(
          color: defaultWhiteColor,
          border: Border.all(color: defaultLightGreyColor, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 54,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    width: 54,
                    child: Image.network(
                      review.image,
                      width: 54,
                      height: 54,
                      // loadingBuilder: (context, child, loadingProgress) =>
                      //     const Icon(Icons.account_circle, size: 54),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 67,
                    bottom: 0,
                    child: SizedBox(
                      height: 54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Said from')
                              .labelLarge(color: defaultDarkGreyColor),
                          Text(review.name, maxLines: 1,)
                              .titleMedium(color: secondaryColor15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Text(
                review.review,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ).bodyMedium(color: const Color(0xff2d2d2d)),
            ),
            SizedBox(
              height: 18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.filled(
                  review.rating,
                  const Icon(
                    Icons.star,
                    color: Color(0xffda372e),
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
