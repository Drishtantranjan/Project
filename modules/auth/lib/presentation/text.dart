import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class ClickableText extends StatelessWidget {
  const ClickableText(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = primaryColor});

  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: color.withOpacity(0.2),
        onTap: onPressed,
        child: Text(text).bodyMedium(color: color),
      ),
    );
  }
}
