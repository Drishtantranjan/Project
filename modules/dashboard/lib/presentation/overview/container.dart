import 'package:dashboard/presentation/overview/provider.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/presentation/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/modules/auth.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class NotLoggedInContainer extends ConsumerWidget {
  const NotLoggedInContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        imageAsset(
          AssetProvider.notLoggedIn,
          size: 200,
        ),
        const Text("Not logged in").labelLarge(color: defaultDarkGreyColor),
        const SizedBox(height: 7),
        const Text("Please signup or login first")
            .bodyMedium(color: defaultDarkGreyColor),
        const SizedBox(height: 20),
        SecondaryButton(
          height: 40,
          width: 150,
          labelText: "Join now",
          onPressed: () {
            context.go(AuthRoutes.walkthroughPath());
            ref.read(pageProvider.notifier).setIndex(0);
          },
        )
      ],
    );
  }
}
