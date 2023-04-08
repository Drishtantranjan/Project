import 'package:auth/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:styles/styles.dart';

const _authFieldConstraints = BoxConstraints(
  minHeight: 50,
  maxHeight: 50,
);

Size getSize(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject()! as RenderBox;
  return renderBox.size;
}

Size _textSize(BuildContext context, String text, TextStyle style, double textScaleFactor) {
  return (TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textScaleFactor: textScaleFactor,
          textDirection: TextDirection.ltr)
        ..layout())
      .size;
}

const countryIndia = Country(
  name: "India",
  flag: "🇮🇳",
  code: "IN",
  dialCode: "91",
  minLength: 10,
  maxLength: 10,
);

void showTooltip({
  required FocusScopeNode focusScopeNode,
  required double textScaleFactor,
  required BuildContext context,
  required String message,
  required Offset offset,
  required Size size,
  required Function(OverlayEntry?) onSet,
}) async {
  final position = RelativeRect.fromLTRB(
    offset.dx,
    offset.dy,
    offset.dx,
    offset.dy,
  );
  final key = GlobalKey();
  final textSize =
      _textSize(context, message, type.bodyMedium ?? const TextStyle(), textScaleFactor).width +
          20;
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      right: position.right - size.width / 2,
      width: textSize,
      top: position.top - 10,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 47,
          child: Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    height: 37,
                    child: Container(
                      alignment: Alignment.centerRight,
                      key: key,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8.5),
                      color: defaultBlackColor,
                      child: Text(
                        message,
                        textAlign: TextAlign.end,
                      ).bodyMedium(color: defaultWhiteColor),
                    ),
                  ),
                  Positioned(
                    bottom: 37,
                    right: 0,
                    height: 3,
                    child: Container(
                      width: textSize,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 18,
                  height: 7,
                  width: 12,
                  child: CustomPaint(
                    painter: _PolygonPainter(
                      color: primaryColor,
                      width: 12,
                      height: 7,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
  onSet(overlayEntry);
  await Future.delayed(const Duration(milliseconds: 2000));
  onSet(null);
}

class _PolygonPainter extends CustomPainter {
  _PolygonPainter(
      {required this.width, required this.height, required this.color});

  final double width;
  final double height;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    Path path = Path();
    // draw a triangle
    path.moveTo(0, height);
    path.lineTo(width / 2, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

InputDecoration authFieldDecoration({
  String? hint,
  String? label,
  TextStyle? labelStyle,
  EdgeInsets? contentPadding,
  Widget? suffix,
  String? errorMessage,
  required VoidCallback onShowTooltip,
}) =>
    InputDecoration(
      contentPadding: contentPadding,
      isDense: true,
      constraints: _authFieldConstraints,
      labelText: label,
      labelStyle: errorMessage != null
          ? labelStyle?.copyWith(color: primaryColor)
          : labelStyle,
      hintStyle: errorMessage != null
          ? labelStyle?.copyWith(color: primaryColor)
          : labelStyle,
      hintText: hint,
      suffixIcon: authFieldErrorSuffix(suffix, errorMessage, onShowTooltip),
      border: errorMessage != null ? focusedBorder : null,
      enabledBorder: errorMessage != null ? focusedBorder : null,
      focusedBorder: errorMessage != null ? focusedBorder : null,
    );

Widget? authFieldErrorSuffix(
    Widget? suffix, String? errorMessage, VoidCallback onShowTooltip) {
  if (errorMessage == null) {
    return suffix ??
        const SizedBox(
          height: 50,
        );
  }
  return IconButton(
    constraints: const BoxConstraints(
      minHeight: 50,
      maxHeight: 50,
    ),
    icon: imageAsset(AssetProvider.textFieldWarningIcon, height: 20, width: 20),
    onPressed: onShowTooltip,
  );
}
