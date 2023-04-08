import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styles/styles.dart';

Future<T?> showHandleBarBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double height = double.infinity,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: HandleBarBottomSheet(
          height: height,
          child: builder(context),
        ),
      ),
    ),
    // constraints: BoxConstraints(minHeight: height),
  );
}

class HandleBarBottomSheet extends HookWidget {
  const HandleBarBottomSheet(
      {super.key, required this.child, required this.height});
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 25),
      decoration: const BoxDecoration(
        color: defaultWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 70,
            height: 6.2,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: child,
          ),
        ],
      ),
    );
  }
}
