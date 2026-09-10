import 'package:flutter_test/flutter_test.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';

void main() {
  group('Result', () {
    test('FailureResult should store stackTrace when provided', () {
      final failure = UnknownFailure(message: 'Test');
      final stackTrace = StackTrace.current;
      final result = FailureResult<void>(failure, stackTrace: stackTrace);

      expect(result.failure, equals(failure));
      expect(result.stackTrace, equals(stackTrace));
    });
  });
}
