// ignore_for_file: library_private_types_in_public_api, duplicate_ignore

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:styles/styles.dart';

import 'shared.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key, required this.onPressed, this.child});

  final VoidCallback onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
          splashColor: defaultWhiteColor.withOpacity(0.1),
          customBorder: const CircleBorder(),
          radius: 50,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          )),
    );
  }
}

typedef _Pop = void Function(BuildContext context);

void _defaultPop(BuildContext context) => context.pop();

class PopButton extends StatelessWidget {
  const PopButton({super.key, this.color, _Pop? pop}) : pop = pop ?? _defaultPop;

  const PopButton.light({super.key, _Pop? pop}) : color = defaultWhiteColor, pop = pop ?? _defaultPop;
  const PopButton.dark({super.key, _Pop? pop}) : color = defaultBlackColor, pop = pop ?? _defaultPop;

  final Color? color;
  // ignore: library_private_types_in_public_api
  final _Pop pop;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SharedAssetProvider.imageAsset(
        SharedAssetProvider.backIcon,
        size: 24,
        color: color ?? defaultBlackColor,
      ),
      onPressed: () => pop(context),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  SecondaryButton(
      {super.key,
      this.label,
      this.labelText,
      required this.onPressed,
      this.height = 50,
      this.width = double.infinity}) {
    assert(label != null || labelText != null);
  }

  Widget get _label => label == null
      ? Text(labelText!).labelLarge(color: defaultWhiteColor)
      : label!;
  final VoidCallback? onPressed;
  final Widget? label;
  final String? labelText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor15,
        foregroundColor: defaultWhiteColor,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: _label,
    );
  }
}

class SecondaryOutlinedButton extends StatelessWidget {
  SecondaryOutlinedButton(
      {super.key,
      this.label,
      this.labelText,
      required this.onPressed,
      this.width = double.infinity}) {
    assert(label != null || labelText != null);
  }

  Widget get _label =>
      label == null ? Text(labelText!).labelLarge(color: blackColor) : label!;
  final VoidCallback? onPressed;
  final Widget? label;
  final String? labelText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: defaultBlackColor,
        foregroundColor: blackColor,
        fixedSize: Size(width, 45),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: secondaryColor15),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: _label,
    );
  }
}

class SecondaryLinkButton extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;
  const SecondaryLinkButton(
      {super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label!)
          .bodyMedium(color: secondaryColor15)
          .alignCenter()
          .underline(),
    );
  }
}
