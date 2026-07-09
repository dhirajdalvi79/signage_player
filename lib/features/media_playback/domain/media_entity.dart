// Entity to be used in UI

enum MediaType { image, video }

class MediaEntity {
  const MediaEntity({required this.type, required this.localPath});
  final MediaType type;
  final String? localPath;
}
