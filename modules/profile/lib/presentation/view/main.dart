import 'package:flutter/material.dart';

class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({super.key});

  static const String pageName = "view";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile View'),
      ),
    );
  }
}
