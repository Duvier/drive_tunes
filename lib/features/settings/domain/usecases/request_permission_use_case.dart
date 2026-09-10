import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/settings/domain/enums/access_enum.dart';
import 'package:drive_tunes/features/settings/domain/repositories/media_library_permission_repository.dart';

final class RequestPermissionUseCase {
  final MediaLibraryPermissionRepository repository;
  const RequestPermissionUseCase({required this.repository});

  Future<Result<AppAccess>> call() async {
    return await repository.requestPermission();
  }
}
