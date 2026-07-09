import 'dart:async';

import 'package:flutter/material.dart';
import 'package:signage_player/core/constants.dart';
import 'package:signage_player/core/extensions.dart';

mixin PlaybackDurationMixin<T extends StatefulWidget> on State<T> {
  int currentIndex = 0;
  int totalItems = 0;
  Timer? _displayTimer;

  @override
  void initState() {
    super.initState();
    'INDEX: $currentIndex'.logInfo();
    _scheduleNext();
  }

  void _scheduleNext() {
    _displayTimer?.cancel();
    _displayTimer = Timer(
      Constants.playbackDisplayDuration,
      _advanceToNextItem,
    );
  }

  void _advanceToNextItem() {
    if (!mounted) return;
    setState(() {
      currentIndex = (currentIndex + 1) % totalItems;
    });
    'INDEX: $currentIndex'.logInfo();
    _scheduleNext();
  }

  @override
  void dispose() {
    _displayTimer?.cancel();
    super.dispose();
  }
}
