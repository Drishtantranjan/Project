import 'package:hive/hive.dart';
import 'package:shared/hive/box_convertor.dart';

class BoxOperations<T> {
  final Box _box;
  final String key;
  final T? defaultValue;
  final BoxConvertor convertor;

  T? _value;

  T? get value {
    _value ??= convertor.fromJson(_box.get(key)) ?? defaultValue;
    return _value;
  }

  BoxOperations(this._box,
      {required this.key, this.defaultValue, required this.convertor});

  void put(T value) {
    _box.put(key, convertor.toJson(value));
  }

  void delete() {
    _box.delete(key);
  }

  set value(T? newValue) {
    if (newValue == null) {
      delete();
    } else {
      put(newValue);
    }
  }
}
