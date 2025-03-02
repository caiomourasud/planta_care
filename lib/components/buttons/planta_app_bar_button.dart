import 'package:flutter/material.dart';

class PlantaAppBarButton extends IconButton {
  PlantaAppBarButton({
    required BuildContext context,
    required super.icon,
    super.onPressed,
    super.key,
  }) : super(
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor:
                Theme.of(context).colorScheme.onSurface.withAlpha(180),
          ),
        );
}
