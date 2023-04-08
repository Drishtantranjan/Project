import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared/button.dart';
import 'package:shared/theme.dart';
import 'package:styles/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.leading,
    required this.systemOverlayStyle,
    required this.isDark,
  });

  final String title;
  final bool isDark;
  final Color backgroundColor;
  final Widget leading;
  final SystemUiOverlayStyle systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title).titleLarge(color: isDark ? defaultWhiteColor : defaultBlackColor),
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      shadowColor: isDark ? backgroundColor : blackColor,
      toolbarHeight: 74,
      leading: leading,
      systemOverlayStyle: systemOverlayStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(74);
}

class DarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DarkAppBar({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title ?? "",
      isDark: true,
      backgroundColor: secondaryColor15,
      leading: const PopButton.light(),
      systemOverlayStyle: darkSecondaryStatusBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(74);
}

class LightAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LightAppBar({
    super.key,
    this.title,
    this.pop,
  });

  final String? title;
  final void Function(BuildContext context)? pop;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title ?? "",
      isDark: false,
      backgroundColor: grey99Color,
      leading: PopButton.dark(pop: pop),
      systemOverlayStyle: lightStatusBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(74);
}
