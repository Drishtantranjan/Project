import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/routes.dart';
import 'package:styles/styles.dart';

class BatchItem extends StatelessWidget {
  const BatchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          CoursesRoutes.overviewHomepath()
        );
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFF32AC71),
            image:  const DecorationImage(
              image: AssetImage(AssetProvider.batchBanner, package: 'dashboard'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Qu'ran Batch A")
                    .headlineMedium(color: defaultWhiteColor),
                const SizedBox(height: 14),
                Row(
                  children: [
                    imageAsset(AssetProvider.batchIc, size: 20),
                    const SizedBox(width: 11),
                    const Text('320 Students')
                        .labelMedium(color: defaultWhiteColor),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
