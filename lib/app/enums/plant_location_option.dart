import 'package:flutter/material.dart';

enum PlantLocationOption {
  pottedIndoor(
    icon: Icons.home_filled,
    title: 'Potted plants indoor',
  ),
  pottedOutdoor(
    icon: Icons.delete,
    title: 'Potted plants outdoor',
  ),
  garden(
    icon: Icons.grass,
    title: 'Garden, plants in ground',
  );

  const PlantLocationOption({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}
