import 'package:fpdart/fpdart.dart';
import 'package:signage_player/core/app_exception.dart';
import 'package:signage_player/features/media_playback/domain/media_entity.dart';

abstract class MediaRepo {
  Future<Either<AppException, List<MediaEntity>>> getMedia();
}
