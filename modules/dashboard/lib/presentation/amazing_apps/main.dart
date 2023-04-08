import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:shared/app_bar.dart';
import 'package:styles/styles.dart';

import 'item.dart';

class AmazingApps extends StatelessWidget {
  const AmazingApps({super.key});

  static const pageName = 'amazing_apps';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(title: "Amazing Islamic Apps"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 22),
              imageAsset(AssetProvider.amazingAppsBanner, size: 200, fit: BoxFit.cover),
              const SizedBox(height: 30,),
              const Text('Amazing Islamic Apps').titleLarge(color: defaultBlackColor),
              const SizedBox(height: 6),
              const Text('You may love the below apps').bodyMedium(color: defaultDarkGreyColor),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => const AppItem(image: AssetProvider.amazingApps01, appName: 'Instagram')),
              ),
              const SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) => const AppItem(image: AssetProvider.amazingApps01, appName: 'Instagram')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}