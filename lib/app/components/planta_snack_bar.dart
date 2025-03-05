import 'package:flutter/material.dart';

enum PlantaSnackBarType { success, error, warning, info }

Color _getSnackBarBackgroundColor(
  BuildContext context, {
  required PlantaSnackBarType type,
}) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  switch (type) {
    case PlantaSnackBarType.success:
      return isDarkMode ? const Color(0xFF10311F) : const Color(0xFFC9FFD0);
    case PlantaSnackBarType.error:
      return isDarkMode ? const Color(0xFF2F1013) : const Color(0xFFFFC4C9);
    case PlantaSnackBarType.warning:
      return isDarkMode ? const Color(0xFF51481B) : const Color(0xFFFDF7BE);
    case PlantaSnackBarType.info:
      return isDarkMode ? const Color(0xFF10273A) : const Color(0xFFC4DDFF);
  }
}

class PlantaSnackBar {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    PlantaSnackBarType type = PlantaSnackBarType.info,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(_PlantaSnackBar(
      message: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      backgroundColor: _getSnackBarBackgroundColor(context, type: type),
    ));
  }
}

class _PlantaSnackBar extends SnackBar {
  _PlantaSnackBar({
    required Widget message,
    super.backgroundColor,
  }) : super(
          content: message,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
        );
}
