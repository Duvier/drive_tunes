import 'package:flutter_test/flutter_test.dart';
import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/errors/ui_error.dart';
import 'package:drive_tunes/core/errors/ui_error_mapper.dart';

void main() {
  late UiErrorMapper mapper;

  setUp(() {
    mapper = const UiErrorMapperImpl();
  });

  group('UiErrorMapper Tests', () {
    test('Should return the same UiError if input is already UiError', () {
      final input = UiError(message: 'Test message');
      final result = mapper.map(input);
      expect(result, equals(input));
    });

    test('Should map PermissionFailure to UiError with dialog displayType', () {
      final failure = PermissionFailure();
      final result = mapper.map(failure, feature: 'library');

      expect(result.title, equals('Acceso Denegado'));
      expect(result.message, equals(failure.message));
      expect(result.displayType, equals(UiErrorDisplayType.dialog));
      expect(result.severity, equals(UiErrorSeverity.warning));
      expect(result.feature, equals('library'));
    });

    test('Should map FileSystemFailure to UiError with snackBar displayType', () {
      final failure = FileSystemFailure();
      final result = mapper.map(failure);

      expect(result.message, equals(failure.message));
      expect(result.displayType, equals(UiErrorDisplayType.snackBar));
    });

    test('Should map SynchronizationFailure to UiError with banner displayType', () {
      final failure = SynchronizationFailure();
      final result = mapper.map(failure);

      expect(result.message, equals(failure.message));
      expect(result.displayType, equals(UiErrorDisplayType.banner));
    });

    test('Should map AppException to UiError with message and cause', () {
      final exception = DatabaseException(message: 'DB crash', cause: 'Isar lock');
      final result = mapper.map(exception);

      expect(result.message, equals('DB crash'));
      expect(result.originalError, equals(exception));
    });

    test('Should map unexpected unknown errors to resilient fallback UiError', () {
      final unknownError = FormatException('Bad format');
      final result = mapper.map(unknownError);

      expect(result.message, contains('Ha ocurrido un error inesperado'));
      expect(result.severity, equals(UiErrorSeverity.error));
      expect(result.originalError, equals(unknownError));
    });
  });
}
