import 'dart:io';

import 'package:flutter/material.dart';
import 'package:signage_player/core/extensions.dart';

class ImageView extends StatelessWidget {
  final String localPath;

  const ImageView({super.key, required this.localPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.file(
        File(localPath),
        fit: BoxFit.cover,

        frameBuilder: (context, child, frame, _) {
          if (frame == null) return const ColoredBox(color: Colors.black);
          return child;
        },

        errorBuilder: (context, error, stackTrace) {
          'ImagePlayer: failed to load $localPath: $error'.logError();
          return const ColoredBox(color: Colors.black);
        },
      ),
    );
  }
}
