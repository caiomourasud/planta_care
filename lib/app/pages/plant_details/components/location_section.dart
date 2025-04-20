import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    this.location,
    super.key,
  });

  final PlantSubLocationModel? location;

  @override
  Widget build(BuildContext context) {
    final location = this.location;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: Text(
            'Location',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 8.0),
        if (location != null)
          ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            tileColor: Theme.of(context).colorScheme.surface,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
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
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
