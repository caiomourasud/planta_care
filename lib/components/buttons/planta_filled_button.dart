import 'package:flutter/material.dart';

class PlantaFilledButton extends FilledButton {
  PlantaFilledButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
    bool isLoading = false,
    super.key,
  }) : super(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(),
                  ),
                )
              : child,
        );
}
