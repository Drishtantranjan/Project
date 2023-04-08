import 'package:flutter/material.dart';

import 'package:styles/styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enabled = true});

  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(45),
          foregroundColor: defaultWhiteColor,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(text).titleMedium(color: defaultWhiteColor),
      ),
    );
  }
}

class AuthLinkButton extends StatelessWidget {
  const AuthLinkButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text).labelLarge(color: primaryColor),
    );
  }
}

class AuthTextButton extends StatelessWidget {
  const AuthTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text).labelLarge(color: primaryColor),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: defaultWhiteColor,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(text).titleMedium(color: defaultWhiteColor),
      ),
    );
  }
}