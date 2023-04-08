import 'package:courses/presentation/batch_overview/announcement/main.dart';
import 'package:courses/presentation/batch_overview/live/main.dart';
import 'package:courses/presentation/batch_overview/overview/main.dart';
import 'package:flutter/material.dart';
import 'package:courses/presentation/assets.dart';
import 'package:styles/theme/color.dart';

class BatchOverviewHomePage extends StatefulWidget {
  static var pageName;

  const BatchOverviewHomePage({Key? key}) : super(key: key);

  @override
  _BatchOverviewHomePageState createState() => _BatchOverviewHomePageState();
}

class _BatchOverviewHomePageState extends State<BatchOverviewHomePage> {
  bool _isImageVisible = true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          if (notification.scrollDelta! < 0) {
            setState(() {
              _isImageVisible = true;
            });
          } else if (notification.scrollDelta! > 0) {
            setState(() {
              _isImageVisible = false;
            });
          }
          return true;
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: _isImageVisible
                  ? MediaQuery.of(context).size.height * 0.2
                  : 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration:  BoxDecoration(
                  color: Color(0xFF32AC71),
                  image: DecorationImage(
                    image: AssetProvider.image(AssetProvider.overView),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF4F4F4),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTab("Overview", 0),
                    _buildTab("Live Classes", 1),
                    _buildTab("Study Materials", 2),
                    _buildTab("Assignments", 3),
                    _buildTab("Tests", 4),
                    _buildTab("Announcements", 5),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  BatchOverviewPage(),
                  BatchLivePage(numClasses: 1,),
                  Container(),
                  Container(),
                  Container(),
                  AnnouncementContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildTab(String text, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, right: 25),
    child: InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              // decoration: _selectedIndex == index
              //     ? TextDecoration.underline
              //     : TextDecoration.none,
              // decorationThickness: _selectedIndex == index ? 5.0 : null,
              // decorationColor: _selectedIndex == index ? Colors.red : null,
              // textBaseline: TextBaseline.alphabetic,
            ),
          ),
          Container(
            height: 5.0,
            decoration: BoxDecoration(
              color: primaryColor

            ),
          )
        ],
      ),
    ),
  );
}

}