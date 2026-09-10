import 'package:drive_tunes/core/database/isar_database_impl.dart';
import 'package:drive_tunes/core/logger/app_logger.dart';
import 'package:drive_tunes/features/library/data/datasources/datasource_abstracts.dart';
import 'package:drive_tunes/features/library/data/datasources/file_picker_data_source.dart';
import 'package:drive_tunes/features/library/data/datasources/isar_database_data_source.dart';
import 'package:drive_tunes/features/library/data/repositories/library_repository_impl.dart';
import 'package:drive_tunes/features/library/data/repositories/media_library_repository_impl.dart';
import 'package:drive_tunes/features/library/domain/repositories/library_repository.dart';
import 'package:drive_tunes/features/library/domain/repositories/media_library_repository.dart';
import 'package:drive_tunes/features/library/domain/services/library_synchronizer_service.dart';
import 'package:drive_tunes/features/library/domain/usecases/get_songs_use_case.dart';
import 'package:drive_tunes/features/library/domain/usecases/synchronize_library_use_case.dart';
import 'package:drive_tunes/features/settings/domain/usecases/check_permission_use_case.dart';
import 'package:drive_tunes/features/settings/domain/usecases/request_permission_use_case.dart';
import 'package:get_it/get_it.dart';

void registerLibraryDependencies(GetIt serviceContainer) {
  serviceContainer.registerFactory<LibraryDatasource>(
    () => IsarDatabaseDatasource(
      isar: serviceContainer<IsarDatabase>(),
      logger: serviceContainer<AppLogger>(),
    ),
  );

  serviceContainer.registerFactory<LibraryRepository>(
    () => LibraryRepositoryImpl(dataSource: serviceContainer()),
  );

  serviceContainer.registerFactory<LibrarySynchronizerService>(
    () => LibrarySynchronizerService(),
  );

  serviceContainer.registerFactory<MediaLibraryDatasource>(
    () => FilePickerDataSource(),
  );

  serviceContainer.registerFactory<MediaLibraryRepository>(
    () => MediaLibraryRepositoryImpl(dataSource: serviceContainer()),
  );

  serviceContainer.registerFactory<GetSongsUseCase>(
    () => GetSongsUseCase(libraryRepository: serviceContainer()),
  );

  serviceContainer.registerFactory<SynchronizeLibraryUseCase>(
    () => SynchronizeLibraryUseCase(
      mediaLibraryRepository: serviceContainer(),
      libraryRepository: serviceContainer(),
      librarySynchronizer: serviceContainer(),
      logger: serviceContainer<AppLogger>(),
    ),
  );

  serviceContainer.registerFactory<CheckPermissionUseCase>(
    () => CheckPermissionUseCase(repository: serviceContainer()),
  );

  serviceContainer.registerFactory<RequestPermissionUseCase>(
    () => RequestPermissionUseCase(repository: serviceContainer()),
  );
}
