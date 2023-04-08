import 'dart:convert';

import 'package:logging/logging.dart';

abstract class BoxConvertor<T> {
  dynamic toJson(T value);
  T? fromJson(dynamic json);
}

abstract class MapBoxConvertor<T> extends BoxConvertor<T> {

  static Logger logger = Logger('MapBoxConvertor');

  Map<String, dynamic>? toMap(T? value);
  T? fromMap(Map<String, dynamic>? map);

  @override
  dynamic toJson(T? value)  {
    final map = toMap(value);
    try {
      return jsonEncode(map);
    } catch (e) {
      logger.severe(e.toString());
      return "null";
    }
  }

  @override
  T? fromJson(dynamic json) {
    final map = jsonDecode(json.toString());
    try {
      return fromMap(map);
    } catch (e) {
      logger.severe(e.toString());
      return null;
    }
  }
}

class EmptyBoxConvertor implements BoxConvertor {
  const EmptyBoxConvertor();
  @override
  dynamic fromJson(dynamic json) {
    return json;
  }

  @override
  dynamic toJson(dynamic value) {
    return value;
  }
}