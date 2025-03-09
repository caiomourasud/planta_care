import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';

enum PlantSubLocationType {
  livingRoom(
    id: 'livingRoom',
    icon: Icons.chair,
    title: 'Living Room',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFF783C),
    plantLocationType: PlantLocationType.indoor,
  ),
  bedroom(
    id: 'bedroom',
    icon: Icons.bed,
    title: 'Bedroom',
    description: "I'm great at plant care advice.",
    color: Color(0xFF1F72D7),
    plantLocationType: PlantLocationType.indoor,
  ),
  kitchen(
    id: 'kitchen',
    icon: Icons.kitchen,
    title: 'Kitchen',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF842FF),
    plantLocationType: PlantLocationType.indoor,
  ),
  office(
    id: 'office',
    icon: Icons.chair_alt,
    title: 'Office',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFC6662),
    plantLocationType: PlantLocationType.indoor,
  ),
  bathroom(
    id: 'bathroom',
    icon: Icons.bathtub_rounded,
    title: 'Bathroom',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF5B71A),
    plantLocationType: PlantLocationType.indoor,
  ),
  hallRoom(
    id: 'hallRoom',
    icon: Icons.table_bar,
    title: 'Hall Room',
    description: "I'm great at plant care advice.",
    color: Color(0xFF73A32C),
    plantLocationType: PlantLocationType.indoor,
  ),
  garden(
    id: 'garden',
    icon: Icons.grass,
    title: 'Garden',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFF783C),
    plantLocationType: PlantLocationType.outdoor,
  ),
  yard(
    id: 'yard',
    icon: Icons.park,
    title: 'Yard',
    description: "I'm great at plant care advice.",
    color: Color(0xFF1F72D7),
    plantLocationType: PlantLocationType.outdoor,
  ),
  terrace(
    id: 'terrace',
    icon: Icons.terrain,
    title: 'Terrace',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF842FF),
    plantLocationType: PlantLocationType.outdoor,
  ),
  balcony(
    id: 'balcony',
    icon: Icons.balcony,
    title: 'Balcony',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFC6662),
    plantLocationType: PlantLocationType.outdoor,
  ),
  roof(
    id: 'roof',
    icon: Icons.roofing,
    title: 'Roof',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF5B71A),
    plantLocationType: PlantLocationType.outdoor,
  );

  const PlantSubLocationType({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.plantLocationType,
  });

  final String id;
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final PlantLocationType plantLocationType;

  static const firstIndoor = livingRoom;
  static const firstOutdoor = garden;

  static const List<PlantSubLocationType> indoor = [
    livingRoom,
    bedroom,
    kitchen,
    office,
    bathroom,
    hallRoom,
  ];

  static const List<PlantSubLocationType> outdoor = [
    garden,
    yard,
    terrace,
    balcony,
    roof,
  ];

  // static const List<PlantSubLocationType> both = [
  //   ...indoor,
  //   ...outdoor,
  // ];
}
