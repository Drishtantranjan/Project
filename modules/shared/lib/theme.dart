import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

final lightStatusBar = systemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.black.withOpacity(0.04),
  statusBarBrightness: Brightness.light,
);
final fullLightStatusBar = systemUiOverlayStyle(
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
);
final darkSecondaryStatusBar = systemUiOverlayStyle(
  statusBarIconBrightness: Brightness.light,
  statusBarColor: Color.alphaBlend(Colors.black.withOpacity(0.2), secondaryColor15),
  statusBarBrightness: Brightness.dark,
);