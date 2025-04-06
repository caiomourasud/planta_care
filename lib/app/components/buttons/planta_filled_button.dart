import 'package:flutter/material.dart';

class PlantaFilledButton extends FilledButton {
  PlantaFilledButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
    bool isLoading = false,
    Color? backgroundColor,
    Color? foregroundColor,
    super.key,
  }) : super(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 20.0,
                    height: 20.0,
                    child: const CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                )
              : child,
        );
}
