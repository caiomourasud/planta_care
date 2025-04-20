import 'package:flutter/material.dart';

enum PlantMaintenanceDifficulty {
  easy(title: 'Easy', color: Colors.green),
  medium(title: 'Medium', color: Colors.orangeAccent),
  hard(title: 'Hard', color: Colors.red);

  final String title;
  final Color color;

  const PlantMaintenanceDifficulty({
    required this.title,
    required this.color,
  });
}
