import 'package:planta_care/app/enums/category.dart';

enum PopularPlant {
  pothos(
    id: 'pothos',
    localUrl: 'assets/images/popular_plants/pothos.png',
    title: 'Pothos',
    description: 'Hardy and ideal for indoor spaces.',
    category: Category.foliage,
  ),
  snakePlant(
    id: 'snakePlant',
    localUrl: 'assets/images/popular_plants/snake_plant.png',
    title: 'Snake Plant',
    description: 'Air-purifying and low maintenance.',
    category: Category.foliage,
  ),
  zzPlant(
    id: 'zzPlant',
    localUrl: 'assets/images/popular_plants/zz_plant.png',
    title: 'ZZ Plant',
    description: 'Great for low-light areas.',
    category: Category.foliage,
  ),
  peaceLily(
    id: 'peaceLily',
    localUrl: 'assets/images/popular_plants/peace_lily.png',
    title: 'Peace Lily',
    description: 'Blooms indoors and purifies air.',
    category: Category.flowering,
  ),
  monstera(
    id: 'monstera',
    localUrl: 'assets/images/popular_plants/monstera.png',
    title: 'Monstera',
    description: 'Exotic and highly decorative foliage.',
    category: Category.foliage,
  ),
  bostonFern(
    id: 'bostonFern',
    localUrl: 'assets/images/popular_plants/boston_fern.png',
    title: 'Boston Fern',
    description: 'Classic shade-loving hanging plant.',
    category: Category.foliage,
  ),
  echeveria(
    id: 'echeveria',
    localUrl: 'assets/images/popular_plants/echeveria.png',
    title: 'Echeveria',
    description: 'Perfect for forgetful waterers.',
    category: Category.succulentsAndCacti,
  ),
  cereusCactus(
    id: 'cereusCactus',
    localUrl: 'assets/images/popular_plants/cereus_cactus.png',
    title: 'Cereus Cactus',
    description: 'Sun-loving and very resilient.',
    category: Category.succulentsAndCacti,
  ),
  anthurium(
    id: 'anthurium',
    localUrl: 'assets/images/popular_plants/anthurium.png',
    title: 'Anthurium',
    description: 'Tropical plant with striking flowers.',
    category: Category.flowering,
  ),
  pilea(
    id: 'pilea',
    localUrl: 'assets/images/popular_plants/pilea.png',
    title: 'Pilea Peperomioides',
    description: 'Highly popular in modern décor.',
    category: Category.foliage,
  );

  const PopularPlant({
    required this.id,
    required this.localUrl,
    required this.title,
    required this.description,
    required this.category,
  });

  final String id;
  final String localUrl;
  final String title;
  final String description;
  final Category category;
}
