import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTabSelector extends HookWidget {
  const CustomTabSelector(
      {super.key,
      required this.controller,
      this.width = 10,
      this.height = 10,
      this.spacing = 5});

  final TabController controller;
  final double width;
  final double height;
  final double spacing;

  Widget _buildDot(Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildOval(Color color) {
    return Container(
      width: width * 2 + spacing,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFD1D1D1);
    const selectedBgColor = Color(0xFF606060);
    final selectedIndex = useState(controller.index);

    useEffect(() {
      void listener() {
        selectedIndex.value = controller.index;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return SizedBox(
      height: height,
      width: (width + spacing) * (controller.length + 1),
      child: Stack(
        children: [
          ...List.generate(
            controller.length + 1,
            (index) => Positioned(
              left: index * (width + spacing),
              top: 0,
              height: height,
              child: _buildDot(bgColor),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            left: selectedIndex.value * (width + spacing),
            top: 0,
            height: height,
            child: _buildOval(selectedBgColor),
          ),
        ],
      ),
    );
  }
}
