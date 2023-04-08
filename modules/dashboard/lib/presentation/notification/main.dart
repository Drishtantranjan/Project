import 'package:flutter/material.dart';

import 'package:dashboard/presentation/notification/item.dart';
import 'package:shared/shared.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static String pageName = 'notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LightAppBar(
        title: 'Notifications',
      ),
      body: ListView(
        children:const  [
          BadgeChip(text: "New", showBadge: true),
          NotificationItem(),
          NotificationItem(),
          BadgeChip(text: "Earlier"),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
        ],
      ),
    );
  }
}
