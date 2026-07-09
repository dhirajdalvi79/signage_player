import 'package:flutter/material.dart';

void showError({
  required String message,
  required BuildContext context,
  VoidCallback? onDone,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [TextButton(onPressed: onDone, child: const Text('Retry'))],
    ),
  );
}
