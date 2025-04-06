import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';

enum Category {
  foliage(
    id: 'foliage',
    icon: Icons.eco,
    localUrl: 'assets/images/categories/foliage.png',
    title: 'Foliage',
    description: 'Plants with beautiful leaves and foliage.',
    plantLocationType: PlantLocationType.indoor,
  ),
  flowering(
    id: 'flowering',
    icon: Icons.local_florist,
    localUrl: 'assets/images/categories/flowering.png',
    title: 'Flowering',
    description: 'Plants that produce beautiful flowers.',
    plantLocationType: PlantLocationType.indoor,
  ),
  succulentsAndCacti(
    id: 'succulentsAndCacti',
    icon: Icons.grass,
    localUrl: 'assets/images/categories/succulents_and_cacti.png',
    title: 'Succulents and Cacti',
    description: 'Drought-resistant plants that store water.',
    plantLocationType: PlantLocationType.indoor,
  ),
  aromatics(
    id: 'aromatics',
    icon: Icons.local_florist,
    localUrl: 'assets/images/categories/aromatics.png',
    title: 'Aromatics',
    description: 'Plants with pleasant fragrances.',
    plantLocationType: PlantLocationType.indoor,
  ),
  trees(
    id: 'trees',
    icon: Icons.park,
    localUrl: 'assets/images/categories/trees.png',
    title: 'Trees',
    description: 'Large outdoor plants that provide shade and structure.',
    plantLocationType: PlantLocationType.outdoor,
  ),
  shrubs(
    id: 'shrubs',
    icon: Icons.forest,
    localUrl: 'assets/images/categories/shrubs.png',
    title: 'Shrubs',
    description: 'Medium-sized woody plants perfect for landscaping.',
    plantLocationType: PlantLocationType.outdoor,
  ),
  vegetables(
    id: 'vegetables',
    icon: Icons.grass,
    localUrl: 'assets/images/categories/vegetables.png',
    title: 'Vegetables',
    description: 'Edible plants for your garden.',
    plantLocationType: PlantLocationType.outdoor,
  ),
  herbs(
    id: 'herbs',
    icon: Icons.eco,
    localUrl: 'assets/images/categories/herbs.png',
    title: 'Herbs',
    description: 'Culinary and medicinal outdoor plants.',
    plantLocationType: PlantLocationType.outdoor,
  );

  const Category({
    required this.id,
    required this.icon,
    required this.localUrl,
    required this.title,
    required this.description,
    required this.plantLocationType,
  });

  final String id;
  final IconData icon;
  final String localUrl;
  final String title;
  final String description;
  final PlantLocationType plantLocationType;

  static const List<Category> indoor = [
    foliage,
    flowering,
    succulentsAndCacti,
    aromatics,
  ];

  static const List<Category> outdoor = [
    trees,
    shrubs,
    vegetables,
    herbs,
  ];
}
