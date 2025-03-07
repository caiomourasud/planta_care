import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';

class PlantLocationOptionCard extends StatelessWidget {
  const PlantLocationOptionCard({
    required this.option,
    this.isSelected = false,
    this.onSelected,
    super.key,
  });

  final PlantLocationOption option;
  final bool isSelected;
  final Function(PlantLocationOption option)? onSelected;

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
            Icon(
              option.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: Text(
                option.title,
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
        contentPadding: const EdgeInsets.only(
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
