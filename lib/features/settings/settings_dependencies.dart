import 'package:drive_tunes/features/settings/data/datasources/permissions_data_source.dart';
import 'package:drive_tunes/features/settings/data/repositories/media_library_permission_repository_impl.dart';
import 'package:drive_tunes/features/settings/domain/repositories/media_library_permission_repository.dart';
import 'package:get_it/get_it.dart';

void registerSettingsDependencies(GetIt serviceContainer) {
  serviceContainer.registerFactory<PermissionsDataSource>(
    () => PermissionsDataSourceImpl(),
  );

  serviceContainer.registerFactory<MediaLibraryPermissionRepository>(
    () => MediaLibraryPermissionRepositoryImpl(
      dataSource: serviceContainer<PermissionsDataSource>(),
    ),
  );
}
