import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';

class PlantCareSectionBottomSheet {
  static Future<void> show(
    BuildContext context, {
    Widget? icon,
    String? title,
    String? careTitle,
    Widget? description,
    Color? color,
    double? level,
    void Function()? onTap,
  }) {
    final descriptionAux = description;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Row(
                  children: [
                    icon ?? const SizedBox.shrink(),
                    const SizedBox(width: 8.0),
                    Text(
                      careTitle ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 40.0,
                child: Divider(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(40),
                ),
              ),
            ),
            if (descriptionAux != null) ...[
              const SizedBox(height: 16.0),
              descriptionAux,
            ],
            const SizedBox(height: 32.0),
            PlantaFilledButton(
              context: context,
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: MediaQuery.paddingOf(context).bottom + 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
