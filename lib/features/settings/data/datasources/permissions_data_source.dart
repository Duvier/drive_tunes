import 'package:drive_tunes/core/app_exceptions.dart';
import 'package:drive_tunes/features/settings/domain/enums/access_enum.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsDataSource {
  Future<AppAccess> checkPermission();
  Future<AppAccess> requestPermission();
  Future<void> openAppSettings();
}

final class PermissionsDataSourceImpl implements PermissionsDataSource {
  @override
  Future<AppAccess> checkPermission() async {
    try {
      final status = await Permission.accessMediaLocation.status;
      return _mapStatusToAccess(status);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        PermissionException(message: 'Error al verificar el permiso', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<AppAccess> requestPermission() async {
    try {
      final status = await Permission.accessMediaLocation.request();
      return _mapStatusToAccess(status);
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        PermissionException(message: 'Error al solicitar el permiso', cause: e),
        stackTrace,
      );
    }
  }

  @override
  Future<void> openAppSettings() async {
    try {
      await openAppSettings();
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(
        PermissionException(
          message: 'Error al abrir la configuración de permisos',
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<AppAccess> _mapStatusToAccess(PermissionStatus status) async {
    switch (status) {
      case PermissionStatus.provisional:
        return AppAccess.allowed;
      case PermissionStatus.granted:
        return AppAccess.allowed;
      case PermissionStatus.denied:
        return AppAccess.denied;
      case PermissionStatus.restricted:
        return AppAccess.requiresSettings;
      case PermissionStatus.limited:
        return AppAccess.denied;
      case PermissionStatus.permanentlyDenied:
        return AppAccess.requiresSettings;
    }
  }
}
