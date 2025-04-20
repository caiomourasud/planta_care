import 'package:flutter/material.dart';

class PlantaAppBarButton extends IconButton {
  PlantaAppBarButton({
    required BuildContext context,
    required super.icon,
    super.onPressed,
    EdgeInsets? padding,
    super.key,
  }) : super(
          style: IconButton.styleFrom(
            padding: padding ?? const EdgeInsets.all(14.0),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor:
                Theme.of(context).colorScheme.onSurface.withAlpha(180),
          ),
        );
}
