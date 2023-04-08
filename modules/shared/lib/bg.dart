import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

extension ColorExtension on Widget {
  Widget bg(Color color, {EdgeInsets? padding}) {
    return Container(
      padding: padding,
      color: color,
      child: this,
    );
  }

  Widget bgSecondaryColor15({EdgeInsets? padding}) {
    return bg(secondaryColor15, padding: padding);
  }
  Widget bgWhite({EdgeInsets? padding}) {
    return bg(defaultWhiteColor, padding: padding);
  }
}