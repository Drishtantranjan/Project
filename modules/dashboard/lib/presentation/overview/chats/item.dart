import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:styles/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 96,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: defaultLightGreyColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SharedAssetProvider.imageAsset(
                      SharedAssetProvider.logoIcon,
                      size: 53),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                // width: 228,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Al-Abrish Islamic Academy')
                        .titleMedium(color: defaultBlackColor),
                    const SizedBox(height: 3),
                    const Text(
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).bodyMedium(color: defaultDarkGreyColor),
                  ],
                ),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const Text('14:22 AM').bodySmall(color: defaultDarkGreyColor),
              const SizedBox(height: 7),
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text('2').labelSmall(color: defaultWhiteColor),
              )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
