import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';
import 'package:planta_care/app/enums/plant_sub_location_type.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';

class PlantSubLocationService {
  static List<PlantSubLocationModel> getPlantSubLocations() {
    return PlantSubLocationType.values
        .map((e) => PlantSubLocationModel(
              id: e.id,
              name: e.title,
              description: e.description,
              plantLocationType: e.plantLocationType,
            ))
        .toList();
  }

  static List<PlantSubLocationModel> getPlantSubLocationsFromType(
    PlantLocationType type,
  ) {
    return type == PlantLocationType.indoor
        ? PlantSubLocationType.indoor
            .map((e) => PlantSubLocationModel(
                  id: e.id,
                  name: e.title,
                  description: e.description,
                  plantLocationType: e.plantLocationType,
                ))
            .toList()
        : PlantSubLocationType.outdoor
            .map((e) => PlantSubLocationModel(
                  id: e.id,
                  name: e.title,
                  description: e.description,
                  plantLocationType: e.plantLocationType,
                ))
            .toList();
  }

  static PlantSubLocationModel? getPlantSubLocationById(String id) {
    return getPlantSubLocations().firstWhereOrNull((e) => e.id == id);
  }

  static Color? getIconColorByPlantLocationModel(PlantSubLocationModel model) {
    return PlantSubLocationType.values
        .firstWhereOrNull((e) => e.id == model.id)
        ?.color;
  }

  static IconData? getIconByPlantLocationModel(PlantSubLocationModel model) {
    return PlantSubLocationType.values
        .firstWhereOrNull((e) => e.id == model.id)
        ?.icon;
  }
}
