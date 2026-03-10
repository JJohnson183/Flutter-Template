import 'package:flutter/material.dart';

class GlobalSnackbar {
  static final snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void show({
    required String message, 
    bool floating = true,
    SnackBarAction? action, 
    Color? backgroundColor,
    Duration? duration,
    VoidCallback? onClosed,
  }) {
    // 1) Get the existing snackbar conroller
    final messenger = snackbarKey.currentState;
    if (messenger == null) return;

    // 2) Clear any existing snackbars before showing new one
    messenger.clearSnackBars();

    // 3) Create and show the snackbar
    final controller = messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        action: action,
        dismissDirection: DismissDirection.horizontal,
        duration: duration ?? const Duration(seconds: 5),
      ),
    );

    // 4) Listen for when the snackbar is closed and run the callback if provided
    controller.closed.then((_) => onClosed?.call());
  }
}