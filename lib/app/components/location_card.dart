import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    required this.location,
    this.onTap,
    this.selected = false,
    this.readOnly = true,
    this.onEditPressed,
    this.onDeletePressed,
    super.key,
  });

  final PlantSubLocationModel location;
  final void Function()? onTap;
  final bool selected;
  final bool readOnly;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withAlpha(20),
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        tileColor: Theme.of(context).colorScheme.surface,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: PlantSubLocationService
                                .getIconColorByPlantLocationModel(location)
                            ?.withAlpha(40) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    PlantSubLocationService.getIconByPlantLocationModel(
                            location) ??
                        Icons.dashboard_customize,
                    color: PlantSubLocationService
                            .getIconColorByPlantLocationModel(location) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
                ),
                if (!readOnly)
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(120),
                    ),
                    onPressed: () {},
                  ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              location.name ?? 'Location',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),
            Text(
              location.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
