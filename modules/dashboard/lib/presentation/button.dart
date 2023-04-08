import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.style,
  });

  final VoidCallback onPressed;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: (style ?? type.labelMedium!).copyWith(color: primaryColor),),
    );
  }
}

class OutlinedPlainButton extends StatelessWidget {
  const OutlinedPlainButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 35),
        side: const BorderSide(color: primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(label).labelMedium(color: primaryColor),
    );
  }
}
