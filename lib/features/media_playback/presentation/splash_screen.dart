import 'package:flutter/material.dart';
import 'package:signage_player/core/service_locator.dart';
import 'package:signage_player/features/media_playback/domain/media_repo.dart';
import 'package:signage_player/features/media_playback/presentation/playback_screen.dart';
import 'package:signage_player/features/shared/components/error_dialog.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => _startDownload());
  }

  Future<void> _startDownload() async {
    final response = await ServiceLocator().sl<MediaRepo>().getMedia();
    response.fold(
      (error) => showError(
        message: error.message,
        context: context,
        onDone: () {
          Navigator.of(context).pop();
          _startDownload();
        },
      ),
      (data) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PlaybackScreen(mediaItems: data)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: FlutterLogo(size: 150)));
}
