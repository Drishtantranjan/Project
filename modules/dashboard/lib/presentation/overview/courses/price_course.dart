import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:styles/styles.dart';

class PriceCourse extends StatelessWidget {
  const PriceCourse({
    super.key,
    required this.banner,
    required this.category,
    required this.title,
    required this.rating,
    required this.originalPrice,
    required this.discountPrice,
    required this.discount,
  });

  final String banner;
  final String category;
  final String title;
  final String rating;
  final String originalPrice;
  final String discountPrice;
  final String discount;

  factory PriceCourse.dummy() => const PriceCourse(
        banner:
            "https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg?cs=srgb&dl=pexels-pixabay-276517.jpg&fm=jpg&w=640&h=427",
        title: 'Excepteur Sint Occaecat Conrei',
        category: "Qu'ran",
        discount: "60%",
        discountPrice: "999",
        originalPrice: "3000",
        rating: "4.5",
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: defaultLightGreyColor)),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: imageAsset(
                          banner,
                          width: 85,
                          height: 92,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 22),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category).titleSmall(color: primaryColor),
                            const SizedBox(height: 4),
                            Text(title, maxLines: 2)
                                .titleMedium(color: defaultBlackColor),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: defaultLightGreyColor, size: 16),
                                const SizedBox(width: 3),
                                Text('$rating rating')
                                    .bodySmall(color: defaultDarkGreyColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('₹$discountPrice/-')
                              .titleLarge(color: secondaryColor15),
                          Text('₹$originalPrice/-')
                              .labelSmall(color: defaultDarkGreyColor)
                              .lineThrough(),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                        ),
                      ),
                      child: Text('$discount% Off')
                          .labelSmall(color: defaultWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
