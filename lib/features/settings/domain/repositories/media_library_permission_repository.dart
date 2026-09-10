import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/settings/domain/enums/access_enum.dart';

abstract interface class MediaLibraryPermissionRepository {
  Future<Result<AppAccess>> checkPermission();
  Future<Result<AppAccess>> requestPermission();
  Future<Result<void>> openAppSettings();
}
