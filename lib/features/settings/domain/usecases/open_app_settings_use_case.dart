import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/features/settings/domain/repositories/media_library_permission_repository.dart';

final class OpenAppSettingsUseCase {
  final MediaLibraryPermissionRepository repository;
  const OpenAppSettingsUseCase({required this.repository});

  Future<Result<void>> call() async {
    return await repository.openAppSettings();
  }
}
