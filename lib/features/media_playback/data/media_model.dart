import 'package:signage_player/features/media_playback/domain/media_entity.dart';

//Data Model
class Result {
  Result({required this.result});

  final List<Media> result;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      result: json["result"] == null
          ? []
          : List<Media>.from(json["result"]!.map((x) => Media.fromJson(x))),
    );
  }
}

class Media extends MediaEntity {
  Media({required this.url, required super.type, super.localPath});

  final String? url;

  factory Media.fromJson(Map<String, dynamic> json) {
    final typeString = json['type'] as String;
    final type = typeString == 'video' ? MediaType.video : MediaType.image;
    return Media(type: type, url: json["url"]);
  }
}
