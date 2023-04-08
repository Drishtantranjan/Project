import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class AssetProvider {
  AssetProvider._();

  static const String prefix = 'assets';
    static const String overView = 'bg_shape.png';
  

  static ImageProvider<Object> image(String asset) {
    return AssetImage('$prefix/$asset', package: "courses");
  }

}

AssetBuilder imageAsset = intelligentAsset("courses", prefix: AssetProvider.prefix);
