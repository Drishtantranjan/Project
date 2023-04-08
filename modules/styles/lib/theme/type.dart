// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';

const normalStyle = TextStyle(
  color: defaultBlackColor,
  fontWeight: FontWeight.w400,
  fontFamily: 'ProductSans',
);

const _boldStyle = TextStyle(
  color: defaultBlackColor,
  fontWeight: FontWeight.w700,
  fontFamily: 'ProductSans',
);

final _displayLargeStyle =
    normalStyle.copyWith(fontSize: 57, height: 64.0 / 57);
final _displayMediumStyle =
    normalStyle.copyWith(fontSize: 45, height: 52.0 / 45);
final _displaySmallStyle =
    normalStyle.copyWith(fontSize: 36, height: 44.0 / 36);

final _headlineLargeStyle =
    _boldStyle.copyWith(fontSize: 32, height: 40.0 / 32);
final _headlineMediumStyle =
    _boldStyle.copyWith(fontSize: 28, height: 36.0 / 28);
final _headlineSmallStyle =
    _boldStyle.copyWith(fontSize: 24, height: 32.0 / 24);

final _titleLargeStyle = _boldStyle.copyWith(fontSize: 22, height: 28.0 / 22);
final _titleMediumStyle =
    _boldStyle.copyWith(fontSize: 16, height: 24.0 / 16, letterSpacing: 0.15);
final _titleSmallStyle =
    _boldStyle.copyWith(fontSize: 14, height: 20.0 / 14, letterSpacing: 0.1);

final _labelLargeStyle =
    _boldStyle.copyWith(fontSize: 16, height: 24.0 / 16, letterSpacing: 0.1);
final _labelMediumStyle =
    _boldStyle.copyWith(fontSize: 14, height: 20.0 / 14, letterSpacing: 0.5);
final _labelSmallStyle =
    _boldStyle.copyWith(fontSize: 12, height: 16.0 / 12, letterSpacing: 0.5);

final _bodyLargeStyle =
    normalStyle.copyWith(fontSize: 16, height: 24.0 / 16, letterSpacing: 0.15);
final _bodyMediumStyle =
    normalStyle.copyWith(fontSize: 14, height: 20.0 / 14, letterSpacing: 0.25);
final _bodySmallStyle =
    normalStyle.copyWith(fontSize: 12, height: 16.0 / 12, letterSpacing: 0.4);

final miniTextStyle = normalStyle.copyWith(
  fontSize: 10,
  height: 14.0 / 10,
  letterSpacing: 0.6,
);

final type = TextTheme(
  displayLarge: _displayLargeStyle,
  displayMedium: _displayMediumStyle,
  displaySmall: _displaySmallStyle,
  headlineLarge: _headlineLargeStyle,
  headlineMedium: _headlineMediumStyle,
  headlineSmall: _headlineSmallStyle,
  titleLarge: _titleLargeStyle,
  titleMedium: _titleMediumStyle,
  titleSmall: _titleSmallStyle,
  labelLarge: _labelLargeStyle,
  labelMedium: _labelMediumStyle,
  labelSmall: _labelSmallStyle,
  bodyLarge: _bodyLargeStyle,
  bodyMedium: _bodyMediumStyle,
  bodySmall: _bodySmallStyle,
);

extension TextExtension on Text {
  Text copyWith({
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      Text(
        data!,
        style: style ?? this.style,
        overflow: overflow ?? this.overflow,
        textAlign: textAlign ?? this.textAlign,
        maxLines: maxLines ?? this.maxLines,
      );

  Text alignCenter() => copyWith(
        textAlign: TextAlign.center,
      );
  Text alignLeft() => copyWith(
        textAlign: TextAlign.left,
      );
  Text lineThrough() => copyWith(
        style: style?.copyWith(decoration: TextDecoration.lineThrough),
      );
  Text underline() => copyWith(
        style: style?.copyWith(decoration: TextDecoration.underline),
      );
  Text displayLarge({
    Color? color,
  }) =>
      copyWith(
        style: type.displayLarge?.copyWith(color: color ?? style?.color),
      );
  Text displayMedium({Color? color}) => copyWith(
        style: type.displayMedium?.copyWith(color: color ?? style?.color),
      );
  Text displaySmall({Color? color}) => copyWith(
        style: type.displaySmall?.copyWith(color: color ?? style?.color),
      );
  Text headlineLarge({Color? color}) => copyWith(
        style: type.headlineLarge?.copyWith(color: color ?? style?.color),
      );
  Text headlineMedium({Color? color}) => copyWith(
        style: type.headlineMedium?.copyWith(color: color ?? style?.color),
      );
  Text headlineSmall({Color? color}) => copyWith(
        style: type.headlineSmall?.copyWith(color: color ?? style?.color),
      );
  Text titleLarge({Color? color}) => copyWith(
        style: type.titleLarge?.copyWith(color: color ?? style?.color),
      );
  Text titleMedium({Color? color}) => copyWith(
        style: type.titleMedium?.copyWith(color: color ?? style?.color),
      );
  Text titleSmall({Color? color}) => copyWith(
        style: type.titleSmall?.copyWith(color: color ?? style?.color),
      );
  Text labelLarge({Color? color}) => copyWith(
        style: type.labelLarge?.copyWith(color: color ?? style?.color),
      );
  Text labelMedium({Color? color}) => copyWith(
        style: type.labelMedium?.copyWith(color: color ?? style?.color),
      );
  Text labelSmall({Color? color}) => copyWith(
        style: type.labelSmall?.copyWith(color: color ?? style?.color),
      );
  Text bodyLarge({Color? color}) => copyWith(
        style: type.bodyLarge?.copyWith(color: color ?? style?.color),
      );
  Text bodyMedium({Color? color}) => copyWith(
        style: type.bodyMedium?.copyWith(color: color ?? style?.color),
      );
  Text bodySmall({Color? color}) => copyWith(
        style: type.bodySmall?.copyWith(color: color ?? style?.color),
      );
  Text mini({Color? color}) => copyWith(
        style: miniTextStyle.copyWith(color: color ?? style?.color),
      );
}
