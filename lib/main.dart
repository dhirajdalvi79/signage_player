import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signage_player/core/service_locator.dart';
import 'package:signage_player/features/media_playback/presentation/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  ServiceLocator().initialize();
  runApp(const SignageApp());
}

class SignageApp extends StatelessWidget {
  const SignageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signage Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const SplashScreen(),
    );
  }
}
