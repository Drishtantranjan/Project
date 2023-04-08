import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class AssetProvider {
  AssetProvider._();

  static const String prefix = 'assets';

  static const String noFiles = 'no-files.jpg';

  static ImageProvider<Object> image(String asset) {
    return AssetImage('$prefix/$asset', package: "profile");
  }

}

AssetBuilder imageAsset = intelligentAsset("profile", prefix: AssetProvider.prefix);
