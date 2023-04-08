import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

import 'page_state.dart';

class BottomTab extends StatelessWidget {
  const BottomTab(
      {super.key, required this.pageConfig, required this.controller});

  final PageConfig pageConfig;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final selected = controller.index == pageConfig.page.index;

    final color = selected ? primaryColor : defaultDarkGreyColor;

    return Tooltip(
      message: pageConfig.text,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 34,
              child: pageConfig.iconBuilder(color),
            ),
            Text(
              pageConfig.text,
              textAlign: TextAlign.center,
              style: normalStyle.copyWith(
                fontSize: 11,
                height: 15 / 11,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class BottomTabBar extends StatelessWidget {
  final TabController controller;
  final List<PageConfig> pages;

  const BottomTabBar(
      {super.key, required this.controller, required this.pages});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.all(0),
      controller: controller,
      indicator: MaterialIndicator(
        topLeftRadius: 0,
        topRightRadius: 0,
        totalTabs: pages.length,
        bottomLeftRadius: 5,
        bottomRightRadius: 5,
        tabPosition: TabPosition.top,
        color: primaryColor,
        height: 5,
        width: 40,
      ),
      tabs: pages
          .map((e) => BottomTab(
                pageConfig: e,
                controller: controller,
              ))
          .toList(),
    );
  }
}

class MaterialIndicator extends Decoration {
  /// Width of the indicator, default set to 4
  final double width;

  /// Height of the indicator. Defaults to 4
  final double height;

  /// Determines to location of the tab, [TabPosition.bottom] set to default.
  final TabPosition tabPosition;

  /// topRight radius of the indicator, default to 5.
  final double topRightRadius;

  /// topLeft radius of the indicator, default to 5.
  final double topLeftRadius;

  /// bottomRight radius of the indicator, default to 0.
  final double bottomRightRadius;

  /// bottomLeft radius of the indicator, default to 0
  final double bottomLeftRadius;

  /// Color of the indicator, default set to [Colors.black]
  final Color color;

  /// Horizontal padding of the indicator, default set 0
  // final double horizontalPadding;

  /// [PagingStyle] determines if the indicator should be fill or stroke, default to fill
  final PaintingStyle paintingStyle;

  /// StrokeWidth, used for [PaintingStyle.stroke], default set to 2
  final double strokeWidth;

  final int totalTabs;

  const MaterialIndicator({
    this.width = 4,
    this.height = 4,
    required this.totalTabs,
    this.tabPosition = TabPosition.bottom,
    this.topRightRadius = 5,
    this.topLeftRadius = 5,
    this.bottomRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.color = primaryColor,
    // this.horizontalPadding = 0,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 2,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      bottomLeftRadius: bottomLeftRadius,
      bottomRightRadius: bottomRightRadius,
      color: color,
      width: width,
      height: height,
      totalTabs: totalTabs,
      // horizontalPadding: horizontalPadding,
      tabPosition: tabPosition,
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      paintingStyle: paintingStyle,
      strokeWidth: strokeWidth,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final MaterialIndicator decoration;
  final double width;
  final double height;
  final TabPosition tabPosition;
  final double topRightRadius;
  final double topLeftRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final Color color;
  // final double horizontalPadding;
  final double strokeWidth;
  final PaintingStyle paintingStyle;
  final int totalTabs;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged, {
    required this.width,
    required this.height,
    required this.totalTabs,
    required this.tabPosition,
    required this.topRightRadius,
    required this.topLeftRadius,
    required this.bottomRightRadius,
    required this.bottomLeftRadius,
    required this.color,
    // required this.horizontalPadding,
    required this.paintingStyle,
    required this.strokeWidth,
  }) : super(onChanged) {
    paintObj
      ..color = color
      ..style = paintingStyle
      ..strokeWidth = strokeWidth;
  }

  final Paint paintObj = Paint();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // assert(horizontalPadding >= 0);
    // assert(horizontalPadding < configuration.size!.width / 2,
    //     "Padding must be less than half of the size of the tab");
    assert(width > 0);
    assert(height > 0);
    assert(strokeWidth >= 0 &&
        strokeWidth < configuration.size!.width / 2 &&
        strokeWidth < configuration.size!.height / 2);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    // Size mysize =
    //     Size(configuration.size!.width - (horizontalPadding * 2), height);
    Size mysize = Size(width, height);

    final padding = ((configuration.size!.width) - width) / 2;

    Offset myoffset = Offset(
      offset.dx + padding,
      offset.dy +
          (tabPosition == TabPosition.bottom
              ? configuration.size!.height - height
              : 0),
    );

    final Rect rect = myoffset & mysize;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
      ),
      paintObj,
    );
  }
}

enum TabPosition { top, bottom }
