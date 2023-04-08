import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class _Icon extends StatelessWidget {
  const _Icon({required this.icon, required this.url, required this.text});

  final String icon;
  final String url;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageAsset(icon, width: 42, height: 42),
        const SizedBox(height: 5),
        Text(text, style: normalStyle.copyWith(fontSize: 14, height: 17/14, color: defaultDarkGreyColor),),
      ],
    );
  }
}

class BottomBox extends StatelessWidget {
  const BottomBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Connect with us").titleLarge(color: defaultBlackColor),
        const SizedBox(height: 21),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Icon(icon: AssetProvider.fbIcon, url: "", text: "facebook"),
            SizedBox(width: 25),
            _Icon(icon: AssetProvider.instaIcon, url: "", text: "instagram"),
            SizedBox(width: 25),
            _Icon(icon: AssetProvider.telegramIcon, url: "", text: "telegram"),
          ],
        ),
      ],
    );
  }
}
