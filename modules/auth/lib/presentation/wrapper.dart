import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(0),
      this.decoration});

  final Widget child;
  final EdgeInsets padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      child: Center(child: child),
    );
  }
}
