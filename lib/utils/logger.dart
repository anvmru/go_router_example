import 'package:flutter/foundation.dart';

void logd(Object message, [String? loggerName]) {
  DebugLogger.log(message, loggerName);
}

void logsd(List<Object?> messages, [String? loggerName]) {
  DebugLogger.logs(messages, loggerName);
}

abstract class DebugLogger {
  static bool isDebug = kDebugMode;

  static logs(List<Object?> messages, [String? loggerName]) {
    if (isDebug) {
      for (var message in messages) {
        // ignore: avoid_print
        if (message != null) print("${loggerName ?? 'dLog'}: $message");
      }
    }
  }

  static log(Object message, [String? loggerName]) {
    logs([message], loggerName);
  }
}
