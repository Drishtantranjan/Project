import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routes/routes.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLog();
  for (var injector in injectors) {
    injector.inject();
  }
  await hiveInit();
  runApp(const ProviderScope(child: AlAlbrishAcademyApp()));
}

class AlAlbrishAcademyApp extends StatelessWidget {
  const AlAlbrishAcademyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: "Al-Albrish Islamic Academy",
      routerConfig: routerConfig,
    );
  }
}
