import 'package:flutter/material.dart';

enum PlantSubLocationType {
  livingRoom(
    icon: Icons.chair,
    title: 'Living Room',
    description: "I'm great at plant care advice.",
  ),
  bedroom(
    icon: Icons.bed,
    title: 'Bedroom',
    description: "I'm great at plant care advice.",
  ),
  kitchen(
    icon: Icons.kitchen,
    title: 'Kitchen',
    description: "I'm great at plant care advice.",
  ),
  office(
    icon: Icons.chair_alt,
    title: 'Office',
    description: "I'm great at plant care advice.",
  ),
  bathroom(
    icon: Icons.bathtub_rounded,
    title: 'Bathroom',
    description: "I'm great at plant care advice.",
  ),
  hallRoom(
    icon: Icons.table_bar,
    title: 'Hall Room',
    description: "I'm great at plant care advice.",
  ),
  garden(
    icon: Icons.grass,
    title: 'Garden',
    description: "I'm great at plant care advice.",
  ),
  yard(
    icon: Icons.park,
    title: 'Yard',
    description: "I'm great at plant care advice.",
  ),
  terrace(
    icon: Icons.terrain,
    title: 'Terrace',
    description: "I'm great at plant care advice.",
  ),
  balcony(
    icon: Icons.balcony,
    title: 'Balcony',
    description: "I'm great at plant care advice.",
  ),
  roof(
    icon: Icons.roofing,
    title: 'Roof',
    description: "I'm great at plant care advice.",
  );

  const PlantSubLocationType({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

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

  static const List<PlantSubLocationType> both = [
    ...indoor,
    ...outdoor,
  ];
}
