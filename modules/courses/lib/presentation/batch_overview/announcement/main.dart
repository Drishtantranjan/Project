import 'package:flutter/material.dart';

class AnnouncementContainer extends StatelessWidget {
  const AnnouncementContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            AnnouncementItem(announcement: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ", subtitle: "data"),
            Divider(),
            AnnouncementItem(announcement: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ", subtitle: "More data"),
            Divider(),
            AnnouncementItem(announcement: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ", subtitle: "Even more data"),
          ],
        ),
      ),
    );
  }
}

class AnnouncementItem extends StatelessWidget {
  final String announcement;
  final String subtitle;

  const AnnouncementItem({Key? key, required this.announcement, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                
                announcement,
                maxLines: 3,
                style: TextStyle(
                  
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF1A4B),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("New",
                style: TextStyle(
                  color: Colors.white
                ),)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
