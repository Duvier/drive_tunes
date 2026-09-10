sealed class AppFailure implements Exception {
  final String message;
  final Object? cause;

  AppFailure({required this.message, this.cause});
  @override
  String toString() {
    if (cause != null) {
      return '$runtimeType: $message\nCaused by: $cause';
    }
    return '$runtimeType: $message';
  }
}

final class PermissionFailure extends AppFailure {
  PermissionFailure({super.cause})
    : super(
        message:
            'Permisos de almacenamiento no concedidos para acceder a la biblioteca de música del dispositivo',
      );
}

final class FileSystemFailure extends AppFailure {
  FileSystemFailure({super.cause})
    : super(
        message: 'Error al acceder a la biblioteca de música del dispositivo',
      );
}

final class DatabaseFailure extends AppFailure {
  DatabaseFailure({super.cause})
    : super(message: 'Error al acceder a la base de datos de la aplicación');
}

final class SynchronizationFailure extends AppFailure {
  SynchronizationFailure({super.cause})
    : super(
        message: 'Error al sincronizar la biblioteca de música del dispositivo',
      );
}

final class UnknownFailure extends AppFailure {
  UnknownFailure({super.cause})
    : super(
        message:
            'Error desconocido al acceder a la biblioteca de música del dispositivo',
      );
}
