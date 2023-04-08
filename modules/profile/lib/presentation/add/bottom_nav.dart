import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styles/styles.dart';

import 'provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    final width = MediaQuery.of(context).size.width;
    final compactWidth = width - 330.0 >= 50;
    final rowWidth = compactWidth ? width - 80 : width - 20;
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 80, minHeight: 80),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: defaultWhiteColor,
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: compactWidth ? 35 : 0, vertical: 5),
          child: CustomPaint(
            painter: _RowPainter(
              width: rowWidth,
              current: page.index,
              titles: const [
                'Personal',
                'Address',
                'Parents',
                'Qualification',
                'KYC',
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RowPainter extends CustomPainter {
  _RowPainter(
      {required this.current, required this.titles, required this.width});

  final int current;
  final List<String> titles;
  final double width;

  Paint linePaint = Paint()
    ..color = defaultLightGreyColor
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  Paint greenPaint = Paint()
    ..color = greenColor
    ..style = PaintingStyle.fill;

  Paint whitePaint = Paint()
    ..color = defaultWhiteColor
    ..style = PaintingStyle.fill;

  Paint lightGreyPaint = Paint()
    ..color = defaultLightGreyColor
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  double dotRadius = 17;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final centerHeight = height / 2 - 4;

    final boxSize = width / titles.length;
    final lineStartOffset = Offset(boxSize / 2, centerHeight);
    final lineEndOffset = Offset(width - boxSize / 2, centerHeight);
    canvas.drawLine(lineStartOffset, lineEndOffset, linePaint);

    for (int i = 0; i < titles.length; i++) {
      
      final isDone = i < current;
      final isSelected = i == current;
      final isActive = isDone || isSelected;
      final textWidth = calcTextSize(titles[i], miniTextStyle).width;
      final textHeight = calcTextSize(titles[i], miniTextStyle).height;
      final textX = (boxSize * i) + (boxSize / 2) - (textWidth / 2);
      final textY = centerHeight + 20 - (textHeight / 2);
      final textOffset = Offset(textX, textY);
      final textPainter = TextPainter(
        text: TextSpan(
            text: titles[i],
            style: miniTextStyle.copyWith(
                color: isActive
                    ? defaultDarkGreyColor
                    : defaultLightGreyColor)),
        textDirection: TextDirection.ltr,
        textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
      )..layout();
      textPainter.paint(canvas, textOffset);

      final dotX = (boxSize * i) + (boxSize / 2);
      final dotOffset = Offset(dotX, centerHeight);

      if (isDone) {
        canvas.drawCircle(dotOffset, dotRadius / 2, greenPaint);
      } else if (isSelected) {
        canvas.drawCircle(dotOffset, dotRadius / 2, greenPaint);
      } else {
        canvas.drawArc(
            Rect.fromCircle(center: dotOffset, radius: dotRadius / 2),
            0,
            360,
            true,
            lightGreyPaint);
        canvas.drawCircle(dotOffset, dotRadius / 2, whitePaint);
      }
      const icon = Icons.check_rounded;
      final offsetX = isDone ? -5 : -3;
      final offsetY = isDone ? -0.5 : 1;
      final indexTextOffset = Offset(((boxSize) / 2) + offsetX + (boxSize * i),
          centerHeight - dotRadius / 2 + offsetY);
      final indexPainter = TextPainter(
        text: TextSpan(
            text:
                isDone ? String.fromCharCode(icon.codePoint) : "${i + 1}",
            style: miniTextStyle.copyWith(
              fontFamily: isDone ? icon.fontFamily : null,
              color: !isActive ? defaultLightGreyColor : defaultWhiteColor,
            )),
        textDirection: TextDirection.ltr,
        textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
      )..layout();
      indexPainter.paint(canvas, indexTextOffset);
    }
  }

  @override
  bool shouldRepaint(_RowPainter oldDelegate) {
    return oldDelegate.current != current ||
        oldDelegate.titles != titles ||
        oldDelegate.current != current;
  }

  Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  @override
  bool shouldRebuildSemantics(_RowPainter oldDelegate) => false;
}
