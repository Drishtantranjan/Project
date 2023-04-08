import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'page_state.dart';

class LazyWidget extends HookWidget {
  const LazyWidget({super.key, required this.pageConfigs, required this.page});

  final int page;

  final List<PageConfig> pageConfigs;
  Widget getWidget(int state) {
    Widget? widget = pageConfigs[state].child;

    if (widget == null) {
      final controller = ScrollController();
      pageConfigs[state].controller = controller;
      pageConfigs[state].child = pageConfigs[state].builder(controller);
      widget = pageConfigs[state].child;
    }
    return widget!;
  }

  @override
  Widget build(BuildContext context) {

    useEffect(() {
      return () {
        for (var element in pageConfigs) {
          element.controller?.dispose();
        }
      };
    }, []);

    return getWidget(page);
  }
}
