import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';

class PlantLocationTypeDropdownItem extends StatelessWidget {
  const PlantLocationTypeDropdownItem({
    required this.locationType,
    super.key,
  });

  final PlantLocationType locationType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(40),
            borderRadius: BorderRadius.circular(50.0),
          ),
          height: 44,
          width: 44,
          child: Icon(
            locationType.icon,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${locationType.title} sites',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              locationType.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
