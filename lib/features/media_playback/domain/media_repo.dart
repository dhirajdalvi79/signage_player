import 'package:signage_player/features/media_playback/domain/media_entity.dart';

abstract class MediaRepo {
  Future<List<MediaEntity>> getMedia();
}
