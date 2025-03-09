import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({
    required this.location,
    super.key,
  });

  final PlantSubLocationModel location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:
            PlantSubLocationService.getIconColorByPlantLocationModel(location)
                    ?.withAlpha(40) ??
                Theme.of(context).colorScheme.onSurface.withAlpha(20),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Icon(
        PlantSubLocationService.getIconByPlantLocationModel(location) ??
            Icons.dashboard_customize,
        color: PlantSubLocationService.getIconColorByPlantLocationModel(
                location) ??
            Theme.of(context).colorScheme.onSurface.withAlpha(120),
      ),
    );
  }
}
