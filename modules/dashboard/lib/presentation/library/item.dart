import 'package:dashboard/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    super.key,
    required this.image,
    required this.author,
    required this.title,
    required this.allowDownload,
    required this.onTap,
  });

  final String image;
  final String author;
  final String title;
  final bool allowDownload;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: defaultWhiteColor,
      height: 266,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 165,
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: imageAsset(image, fit: BoxFit.cover),
                  ),
                ),
                if (allowDownload)
                  const Positioned(
                    right: 9,
                    bottom: 10,
                    child: _DownloadButton(),
                  ),
              ],
            ),
          ),
          const ConstraintFlexible(maxHeight: 15, minHeight: 1),
          SizedBox(
              width: 165,
              child: Text(title).labelMedium(color: defaultBlackColor)),
          SizedBox(
              width: 165,
              child: Text("by $author").mini(color: defaultDarkGreyColor)),
        ],
      ),
    );
  }
}

class _DownloadButton extends StatelessWidget {
  const _DownloadButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: grey99Color,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        splashColor: blackColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5),
        onTap: () {},
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: grey99Color,
          ),
          child: const Icon(Icons.download),
        ),
      ),
    );
  }
}
