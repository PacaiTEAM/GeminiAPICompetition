import 'package:logger/logger.dart';

class ApplicationLogger extends Logger {
  static const _loggerLevel = Level.all;

  ApplicationLogger()
      : super(
          printer: SimplePrinter(printTime: true),
          level: _loggerLevel,
        );
}
