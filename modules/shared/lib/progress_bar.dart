import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

enum SliderPosition {
  prefix,
  suffix,
}

class AppProgressBar extends StatelessWidget {
  const AppProgressBar(
      {super.key,
      required this.value,
      this.sliderPosition = SliderPosition.prefix});

  final double value;
  final SliderPosition sliderPosition;

  Widget _buildText(double value) {
    return Text(
      "${value.toInt()}%",
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 22 / 12,
        letterSpacing: 0.01,
        color: defaultDarkGreyColor,
      ),
    );
  }

  Widget _buildSpacer() {
    return const SizedBox(width: 8);
  }

  Widget _buildProgressBar(double percentage) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: LinearProgressIndicator(
        minHeight: 6,
        backgroundColor: defaultLightGreyColor,
        value: percentage,
        color: greenColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      if (sliderPosition == SliderPosition.suffix) _buildText(value),
      if (sliderPosition == SliderPosition.suffix) _buildSpacer(),
      Flexible(
        child: _buildProgressBar(value / 100),
      ),
      if (sliderPosition == SliderPosition.prefix) _buildSpacer(),
      if (sliderPosition == SliderPosition.prefix) _buildText(value),
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
