import 'package:drive_tunes/core/result.dart';
import 'package:drive_tunes/domain/entities/song.dart';

abstract interface class MediaLibraryRepository {
  Future<Result<List<Song>>> scanMediaLibrary();
}
