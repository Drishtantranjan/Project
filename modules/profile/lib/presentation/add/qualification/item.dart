import 'package:flutter/material.dart';
import 'package:profile/presentation/add/provider.dart';

import 'package:styles/styles.dart';

class QualificationDetailItem extends StatelessWidget {
  const QualificationDetailItem({super.key, required this.details});

  final ProfileQualificationData details;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 24;
    return Padding(
      padding: const EdgeInsets.only(bottom: 21),
      child: Container(
        width: width,
        padding:
            const EdgeInsets.only(top: 17, bottom: 18, left: 22, right: 16),
        decoration: BoxDecoration(
          border: Border.all(color: defaultLightGreyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${details.course} ${details.specialization}").titleMedium(color: defaultBlackColor),
                  const SizedBox(height: 5),
                  Text(details.university).bodyMedium(color: defaultDarkGreyColor),
                  const SizedBox(height: 5),
                  Text("${details.yearOfPassing} Passed Out").bodyMedium(color: defaultDarkGreyColor),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 32,
                height: 32,
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: const Color(0xff004ecd),
                  onPressed: () {},
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                    size: 22,
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
