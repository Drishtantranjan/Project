import 'package:hive/hive.dart';

import 'box_convertor.dart';
import 'box_operations.dart';

abstract class BoxHolder {
  BoxOperations<T> ref<T>(String key, {T? defaultValue, BoxConvertor? convertor});
}

typedef BoxInitCallback = void Function(Box box);

class BoxHolderFuture extends BoxHolder {

  Box? box;

  @override
  BoxOperations<T> ref<T>(String key,
      {T? defaultValue, BoxConvertor? convertor}) {
    if (box == null) {
      throw Exception('Box is not initialized');
    }
    final boxOperations = BoxOperations<T>(
      box!,
      key: key,
      defaultValue: defaultValue,
      convertor: convertor ?? const EmptyBoxConvertor(),
    );
    return boxOperations;
  }

  final Future<Box> future;

  bool get isInitialized => box != null;

  BoxHolderFuture(this.future);
}

class BoxHolderValue extends BoxHolder {

  @override
  BoxOperations<T> ref<T>(String key,
      {T? defaultValue, BoxConvertor? convertor}) {
    final boxOperations = BoxOperations<T>(
      box,
      key: key,
      defaultValue: defaultValue,
      convertor: convertor ?? const EmptyBoxConvertor(),
    );
    return boxOperations;
  }

  final Box box;

  BoxHolderValue(this.box);
}