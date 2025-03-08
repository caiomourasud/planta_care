import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_sub_location_type.dart';

enum PlantLocationType {
  indoor(
    icon: Icons.home_filled,
    title: 'Indoor',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.indoor,
  ),
  outdoor(
    icon: Icons.grass,
    title: 'Outdoor',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.outdoor,
  ),
  both(
    icon: Icons.home,
    title: 'Both',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.both,
  );

  const PlantLocationType({
    required this.icon,
    required this.title,
    required this.description,
    this.subLocations = const [],
  });

  final IconData icon;
  final String title;
  final String description;
  final List<PlantSubLocationType> subLocations;
}
