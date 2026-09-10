import 'package:flutter_test/flutter_test.dart';
import 'package:drive_tunes/core/logger/app_logger_impl.dart';

void main() {
  group('AppLoggerImpl', () {
    const logger = AppLoggerImpl();

    test('should execute log methods without throwing exceptions', () {
      expect(() => logger.debug('Debug message'), returnsNormally);
      expect(() => logger.info('Info message'), returnsNormally);
      expect(
        () => logger.warning(
          'Warning message',
          error: Exception('test warning'),
          stackTrace: StackTrace.current,
        ),
        returnsNormally,
      );
      expect(
        () => logger.error(
          'Error message',
          error: Exception('test error'),
          stackTrace: StackTrace.current,
        ),
        returnsNormally,
      );
    });
  });
}
