import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signage_player/core/dio_instance.dart';
import 'package:signage_player/features/media_playback/data/media_model.dart';
import 'package:signage_player/features/media_playback/data/response_data.dart';
import 'package:signage_player/features/media_playback/domain/media_entity.dart';
import 'package:signage_player/features/media_playback/domain/media_repo.dart';

class MediaRepoImpl implements MediaRepo {
  const MediaRepoImpl({required this.mock, required this.dio});
  final MockResponse mock;
  final DioInstance dio;
  @override
  Future<List<MediaEntity>> getMedia() async {
    final data = await mock.getMediaDataMock();
    Map<String, dynamic> parsed = jsonDecode(data);
    final media = await downloadAll(Result.fromJson(parsed));

    return media;
  }

  Future<List<MediaEntity>> downloadAll(Result data) async {
    final Directory cacheDir = await getApplicationSupportDirectory();

    final List<MediaEntity> items = await Future.wait(
      data.result.map((element) {
        return _downloadItem(
          name: element.url?.split('/').lastOrNull ?? '',
          type: element.type,
          url: element.url ?? '',
          cacheDir: cacheDir,
        );
      }),
    );

    return items;
  }

  Future<MediaEntity> _downloadItem({
    required String name,
    required MediaType type,
    required String url,
    required Directory cacheDir,
  }) async {
    final String extension = type == MediaType.video ? 'mp4' : 'jpg';
    final String fileName = 'signage_$name.$extension';
    final String savePath = '${cacheDir.path}/$fileName';

    if (!File(savePath).existsSync()) {
      await dio.dio.download(
        url,
        savePath,
        options: Options(followRedirects: true, maxRedirects: 5),
      );
    }

    return MediaEntity(type: type, localPath: savePath);
  }
}
