sealed class AppException implements Exception {
  final String message;
  final Object? cause;

  AppException({required this.message, this.cause});

  @override
  String toString() {
    if (cause != null) {
      return '$runtimeType: $message\nCaused by: $cause';
    }
    return '$runtimeType: $message';
  }
}

final class DatabaseException extends AppException {
  DatabaseException({required super.message, required super.cause});
}

final class PermissionException extends AppException {
  PermissionException({required super.message, required super.cause});
}

final class FileSystemException extends AppException {
  FileSystemException({required super.message, required super.cause});
}

final class UnknownException extends AppException {
  UnknownException({required super.message, required super.cause});
}
