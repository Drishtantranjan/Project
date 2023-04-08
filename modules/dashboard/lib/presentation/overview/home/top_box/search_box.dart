import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:routes/routes.dart';
import 'package:styles/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => context.push(DashboardRoutes.searchPath()),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Stack(
              children: [
                Positioned(
                    left: 18.77,
                    top: 0,
                    bottom: 0,
                    child: imageAsset(
                      AssetProvider.searchIcon,
                      size: 25,
                      color: defaultDarkGreyColor,
                    )),
                Positioned(
                    left: 58.51,
                    top: 13,
                    bottom: 13,
                    child: const Text('Looking for courses?')
                        .bodyLarge(color: defaultDarkGreyColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
