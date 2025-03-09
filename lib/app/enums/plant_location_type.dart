import 'package:flutter/material.dart';

enum PlantLocationType {
  indoor(
    icon: Icons.home_filled,
    title: 'Indoor',
    description: "I'm great at plant care advice.",
  ),
  outdoor(
    icon: Icons.grass,
    title: 'Outdoor',
    description: "I'm great at plant care advice.",
  ),
  both(
    icon: Icons.home,
    title: 'Both',
    description: "I'm great at plant care advice.",
  );

  const PlantLocationType({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
