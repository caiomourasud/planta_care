import 'package:flutter/material.dart';

class PlantaOutlinedButton extends OutlinedButton {
  PlantaOutlinedButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
    super.key,
  }) : super(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
}
