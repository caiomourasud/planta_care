import 'package:flutter/material.dart';

enum PlantSubLocationType {
  livingRoom(
    icon: Icons.chair,
    title: 'Living Room',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFF783C),
  ),
  bedroom(
    icon: Icons.bed,
    title: 'Bedroom',
    description: "I'm great at plant care advice.",
    color: Color(0xFF1F72D7),
  ),
  kitchen(
    icon: Icons.kitchen,
    title: 'Kitchen',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF842FF),
  ),
  office(
    icon: Icons.chair_alt,
    title: 'Office',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFC6662),
  ),
  bathroom(
    icon: Icons.bathtub_rounded,
    title: 'Bathroom',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF5B71A),
  ),
  hallRoom(
    icon: Icons.table_bar,
    title: 'Hall Room',
    description: "I'm great at plant care advice.",
    color: Color(0xFF73A32C),
  ),
  garden(
    icon: Icons.grass,
    title: 'Garden',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFF783C),
  ),
  yard(
    icon: Icons.park,
    title: 'Yard',
    description: "I'm great at plant care advice.",
    color: Color(0xFF1F72D7),
  ),
  terrace(
    icon: Icons.terrain,
    title: 'Terrace',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF842FF),
  ),
  balcony(
    icon: Icons.balcony,
    title: 'Balcony',
    description: "I'm great at plant care advice.",
    color: Color(0xFFFC6662),
  ),
  roof(
    icon: Icons.roofing,
    title: 'Roof',
    description: "I'm great at plant care advice.",
    color: Color(0xFFF5B71A),
  );

  const PlantSubLocationType({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;

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
