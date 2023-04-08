import 'package:flutter/material.dart';

enum PageState {
  home,
  batch,
  courses,
  shop,
  chats,
}

const pages = [
  PageState.home,
  PageState.batch,
  PageState.courses,
  PageState.shop,
  PageState.chats,
];

typedef IconBuilder = Widget Function(Color color);

class PageConfig {
  final PageState page;
  final String text;
  final IconBuilder iconBuilder;
  final double? iconSize;
  final Function(ScrollController) builder;
  Widget? child;
  ScrollController? controller;

  PageConfig({required this.page, required this.builder, required this.iconBuilder, required this.text, this.iconSize});
}
