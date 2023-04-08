import 'package:flutter/material.dart';

class ConstraintFlexible extends StatelessWidget {
  const ConstraintFlexible({
    super.key,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.child,
  });

  final double? minWidth, maxWidth, minHeight, maxHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: child,
      ),
    );
  }
}

class MaxHeight extends StatelessWidget {
  const MaxHeight(
    this.height, {
    super.key,
    this.child,
  });

  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      child: child,
    );
  }
}

class MinHeight extends StatelessWidget {
  const MinHeight(
    this.height, {
    super.key,
    this.child,
  });

  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: child,
    );
  }
}

class MaxWidth extends StatelessWidget {
  const MaxWidth(
    this.width, {
    super.key,
    this.child,
  });

  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: child,
    );
  }
}

class MinWidth extends StatelessWidget {
  const MinWidth(
    this.width, {
    super.key,
    this.child,
  });

  final double width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: width,
      ),
      child: child,
    );
  }
}