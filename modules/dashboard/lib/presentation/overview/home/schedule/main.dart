import 'package:flutter/material.dart';

import 'package:dashboard/presentation/overview/home/schedule/item.dart';
import 'package:styles/styles.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 30, bottom: 18),
            child: Row(
              children: [
                const Text("Today,").labelLarge(color: secondaryColor15),
                const Text(" "),
                const Text("14 Dec").bodyLarge(color: defaultDarkGreyColor),
              ],
            ),
          ),
          const ScheduleItem(
            course: "Qu'ran Batch A",
            name: "Arabic - Introduction",
            time: "03:00 - 04:00 pm",
          ),
        ],
      ),
    );
  }
}
