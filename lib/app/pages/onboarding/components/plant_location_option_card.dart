import 'package:flutter/material.dart';

class PlantOptionCard<T> extends StatelessWidget {
  const PlantOptionCard({
    required this.option,
    required this.buildTitle,
    this.isSelected = false,
    this.onSelected,
    this.buildIcon,
    this.contentPadding,
    super.key,
  });

  final T option;
  final String Function(T option) buildTitle;
  final bool isSelected;
  final void Function(T option)? onSelected;
  final IconData? Function(T option)? buildIcon;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: () {
          onSelected?.call(option);
        },
        title: Row(
          spacing: 16.0,
          children: [
            if (buildIcon != null)
              Icon(
                buildIcon?.call(option),
                color: Theme.of(context).colorScheme.primary,
              ),
            Expanded(
              child: Text(
                buildTitle(option),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            Radio(
              value: true,
              fillColor: WidgetStateProperty.all(
                isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              groupValue: isSelected,
              onChanged: (value) {
                onSelected?.call(option);
              },
            ),
          ],
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.only(
              left: 24.0,
              right: 8.0,
            ),
        splashColor: Theme.of(context).colorScheme.primary.withAlpha(20),
        hoverColor: Theme.of(context).colorScheme.primary.withAlpha(20),
        focusColor: Theme.of(context).colorScheme.primary.withAlpha(20),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: BorderRadius.circular(60.0),
        ),
      ),
    );
  }
}
