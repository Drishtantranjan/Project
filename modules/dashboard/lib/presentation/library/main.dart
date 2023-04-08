import 'package:dashboard/presentation/row.dart';
import 'package:flutter/material.dart';
import 'package:routes/data/auth/hive.dart';
import 'package:shared/shared.dart';

import 'item.dart';

class LibraryPage extends HookWidget {
  const LibraryPage({super.key});

  static String pageName = 'library';

  @override
  Widget build(BuildContext context) {
    final user = AuthBox.useUser();
    return Scaffold(
      appBar: const LightAppBar(
        title: 'Library',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 17, bottom: 10, left: 24, right: 24),
            child: FilterSearchRow(),
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 256,
              childAspectRatio: 165 / 266,
              crossAxisSpacing: 14,
              mainAxisSpacing: 17,
            ),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => LibraryItem(
              image: 'https://i.ibb.co/Gs5bZSP/pexels-matheus-bertelli-573299.jpg',
              author: "Author",
              title: "Title",
              onTap: () {},
              allowDownload: user.value != null,
            ),
          ),
        ],
      ),
    );
  }
}
