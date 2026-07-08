import 'package:flutter/material.dart';
import 'package:signage_player/features/media_playback/domain/media_entity.dart';
import 'package:signage_player/features/media_playback/presentation/components/image_view.dart';
import 'package:signage_player/features/media_playback/presentation/components/video_player.dart';
import 'package:signage_player/features/media_playback/presentation/playback_duration_mixin.dart';

class PlaybackScreen extends StatefulWidget {
  const PlaybackScreen({super.key, required this.mediaItems});
  final List<MediaEntity> mediaItems;

  @override
  State<PlaybackScreen> createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen>
    with PlaybackDurationMixin {
  @override
  void initState() {
    super.initState();
    totalItems = widget.mediaItems.length;
  }

  @override
  Widget build(BuildContext context) {
    final MediaEntity currentItem = widget.mediaItems[currentIndex];
    return Scaffold(
      body: switch (currentItem.type) {
        MediaType.image => ImageView(
          key: ValueKey('image_$currentItem'),
          localPath: currentItem.localPath ?? '',
        ),

        MediaType.video => VideoPlayerWidget(
          key: ValueKey('video_$currentItem'),
          localPath: currentItem.localPath ?? '',
        ),
      },
    );
  }
}
