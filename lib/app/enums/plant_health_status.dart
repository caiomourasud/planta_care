import 'package:flutter/material.dart';

enum PlantHealthStatus {
  healthy(
    icon: Icons.favorite,
    title: 'Healthy',
  ),
  needsAttention(
    icon: Icons.warning,
    title: 'Needs Attention',
  ),
  sick(
    icon: Icons.sick,
    title: 'Sick',
  ),
  dying(
    icon: Icons.dangerous,
    title: 'Dying',
  );

  const PlantHealthStatus({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}
