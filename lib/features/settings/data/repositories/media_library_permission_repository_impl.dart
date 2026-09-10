import 'package:drive_tunes/core/app_failures.dart';
import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/settings/data/datasources/permissions_data_source.dart';
import 'package:drive_tunes/features/settings/domain/enums/access_enum.dart';
import 'package:drive_tunes/features/settings/domain/repositories/media_library_permission_repository.dart';

final class MediaLibraryPermissionRepositoryImpl
    implements MediaLibraryPermissionRepository {
  final PermissionsDataSource dataSource;

  MediaLibraryPermissionRepositoryImpl({required this.dataSource});

  @override
  Future<Result<AppAccess>> checkPermission() async {
    try {
      final access = await dataSource.checkPermission();
      return SuccessResult(access);
    } catch (e, stackTrace) {
      return FailureResult(PermissionFailure(), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<AppAccess>> requestPermission() async {
    try {
      final access = await dataSource.requestPermission();
      if (access != AppAccess.allowed) {
        return FailureResult(
          PermissionFailure(),
          stackTrace: StackTrace.current,
        );
      }
      return SuccessResult(access);
    } catch (e, stackTrace) {
      return FailureResult(PermissionFailure(), stackTrace: stackTrace);
    }
  }

  @override
  Future<Result<void>> openAppSettings() async {
    try {
      await dataSource.openAppSettings();
      return SuccessResult(null);
    } catch (e, stackTrace) {
      return FailureResult(PermissionFailure(), stackTrace: stackTrace);
    }
  }
}
