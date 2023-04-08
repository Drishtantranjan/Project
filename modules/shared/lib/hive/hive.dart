import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared/hive/box_convertor.dart';

import 'box_holder.dart';
import 'box_operations.dart';

typedef HiveRef<T> = BoxOperations<T>;
typedef HiveHolder = BoxHolderFuture;

HiveRef<T> useBox<T>(BoxHolderValue holder, String key,
    {T? defaultValue, BoxConvertor? convertor}) {
  return holder.ref(key, convertor: convertor, defaultValue: defaultValue);
}

class _WhiteLoading extends StatelessWidget {
  const _WhiteLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

Future<void> hiveInit() async {
  await Hive.initFlutter();
}

abstract class HiveBoxInitiator extends StatelessWidget {
  const HiveBoxInitiator({super.key});

  Future<void> initHiveBoxes();

  Widget createWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initHiveBoxes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error!);
          }
          return createWidget(context);
        }
        return const _WhiteLoading();
      },
    );
  }
}

Future<void> hiveBoxInit(String boxName) async {
  await Hive.openBox(boxName);
}