import 'package:flutter/foundation.dart';

import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

void initLog() {
  final DateFormat formatter = DateFormat('HH:mm:ss');
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      debugPrint('${record.loggerName} ${record.level.name}: ${formatter.format(record.time)}: ${record.message}');
    }
  });
}