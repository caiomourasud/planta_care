import 'package:planta_care/app/enums/plant_sub_location_type.dart';

enum PlantLocationType {
  indoor(
    title: 'Indoor',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.indoor,
  ),
  outdoor(
    title: 'Outdoor',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.outdoor,
  ),
  both(
    title: 'Both',
    description: "I'm great at plant care advice.",
    subLocations: PlantSubLocationType.both,
  );

  const PlantLocationType({
    required this.title,
    required this.description,
    this.subLocations = const [],
  });

  final String title;
  final String description;
  final List<PlantSubLocationType> subLocations;
}
