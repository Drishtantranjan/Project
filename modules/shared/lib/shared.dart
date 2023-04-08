library shared;

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:logging/logging.dart';
export 'assets.dart';
export 'button.dart';
export 'bottom_sheet.dart' show showHandleBarBottomSheet;
export 'progress_bar.dart';
export 'bg.dart';
export 'wrapper.dart';
export 'tab_selector.dart';
export 'hive/hive.dart' show hiveBoxInit, hiveInit, useBox, HiveBoxInitiator;
export 'theme.dart';
export 'app_bar.dart';
export 'hive/box_convertor.dart' show MapBoxConvertor;
export 'dialog.dart';
export 'logging.dart';
export 'checkbox.dart';

typedef AssetBuilder = Widget Function(String,
    {BoxFit? fit,
    Color? color,
    double? height,
    double? width,
    double? size,
    String? fallbackAsset});

AssetBuilder intelligentAsset(String package, {required String prefix}) {
  function(
    String asset, {
    double? size,
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    String? fallbackAsset,
  }) {
    if (height == null && width == null && size != null) {
      width = size;
      height = size;
    }
    if (asset.startsWith('http')) {
      return Image(
        image: CachedNetworkImageProvider(asset),
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return fallbackAsset == null
              ? child
              : Image.asset(
                  "$prefix/$fallbackAsset",
                  width: width,
                  height: height,
                  fit: fit,
                  package: package,
                );
        },
        errorBuilder: fallbackAsset == null
            ? null
            : (context, error, stackTrace) => Image.asset(
                  "$prefix/$fallbackAsset",
                  width: width,
                  height: height,
                  fit: fit,
                  package: package,
                ),
      );
    }

    if (asset.endsWith('.svg')) {
      return SvgPicture.asset(
        "$prefix/$asset",
        width: width,
        colorBlendMode: BlendMode.srcIn,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: color,
        package: package,
      );
    }
    return Image.asset(
      "$prefix/$asset",
      width: width,
      height: height,
      package: package,
      fit: fit,
    );
  }

  return function;
}
