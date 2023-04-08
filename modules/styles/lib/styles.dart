library styles;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/color.dart';
import 'theme/type.dart';

export 'theme/color.dart';
export 'theme/type.dart';

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(7)),
  borderSide: BorderSide(color: defaultLightGreyColor),
);

final focusedBorder = outlineInputBorder.copyWith(
  borderSide: const BorderSide(color: primaryColor),
);

SystemUiOverlayStyle systemUiOverlayStyle({
  Brightness? statusBarIconBrightness,
  Color? statusBarColor,
  Brightness? statusBarBrightness,
}) =>
    SystemUiOverlayStyle(
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarColor: statusBarColor,
      statusBarBrightness: statusBarBrightness,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

final themeData = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    primary: primaryColor,
    secondary: secondaryColor,
    onPrimary: defaultWhiteColor,
    onSecondary: defaultWhiteColor,
    onBackground: blackColor,
    background: defaultWhiteColor,
    error: highlightColor,
    onError: defaultWhiteColor,
    onSurface: blackColor,
    surface: defaultWhiteColor,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: systemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  textTheme: type,
  scaffoldBackgroundColor: defaultWhiteColor,
  backgroundColor: defaultWhiteColor,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: type.bodyLarge!.copyWith(color: defaultBlackColor),
    hintStyle: type.bodyLarge!.copyWith(color: defaultDarkGreyColor),
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: defaultWhiteColor,
    selectedItemColor: primaryColor,
    unselectedItemColor: defaultDarkGreyColor,
  ),
);
