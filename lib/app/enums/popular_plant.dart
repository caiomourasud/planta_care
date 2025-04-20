import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/enums/light_needs.dart';
import 'package:planta_care/app/enums/plant_maintenance_difficult.dart';
import 'package:planta_care/app/enums/toxicity_level.dart';
import 'package:planta_care/app/enums/watering_needs.dart';

enum PopularPlant {
  pothos(
    id: 'pothos',
    localUrl: 'assets/images/popular_plants/pothos.png',
    title: 'Pothos',
    description: 'Hardy and ideal for indoor spaces.',
    largeDescription: 'Pothos is a hardy plant that thrives in a variety of '
        'indoor environments. It is known for its trailing vines '
        'and heart-shaped leaves, making it a popular choice for '
        'hanging baskets and shelves. Pothos is also excellent at '
        'purifying the air, removing toxins such as formaldehyde '
        'and benzene.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  snakePlant(
    id: 'snakePlant',
    localUrl: 'assets/images/popular_plants/snake_plant.png',
    title: 'Snake Plant',
    description: 'Air-purifying and low maintenance.',
    largeDescription: 'The Snake Plant, also known as Sansevieria, is a '
        'resilient plant that can survive in low light and '
        'with infrequent watering. Its upright, sword-like '
        'leaves are not only striking but also effective at '
        'filtering indoor air, making it a great addition to '
        'bedrooms and living spaces.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.toxic,
  ),
  zzPlant(
    id: 'zzPlant',
    localUrl: 'assets/images/popular_plants/zz_plant.png',
    title: 'ZZ Plant',
    description: 'Great for low-light areas.',
    largeDescription: 'The ZZ Plant is a hardy indoor plant that can tolerate '
        'low light and drought conditions. Its glossy, dark green '
        'leaves add a touch of elegance to any room. The ZZ Plant '
        'is also known for its ability to improve indoor air quality '
        'by removing pollutants.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  peaceLily(
    id: 'peaceLily',
    localUrl: 'assets/images/popular_plants/peace_lily.png',
    title: 'Peace Lily',
    description: 'Blooms indoors and purifies air.',
    largeDescription:
        'Peace Lilies are popular for their beautiful white blooms and '
        'ability to thrive in low light. They are excellent at purifying '
        'the air, removing toxins such as ammonia and formaldehyde. '
        'Peace Lilies prefer moist soil and should be watered regularly.',
    category: Category.flowering,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  monstera(
    id: 'monstera',
    localUrl: 'assets/images/popular_plants/monstera.png',
    title: 'Monstera',
    description: 'Exotic and highly decorative foliage.',
    largeDescription:
        'Monstera, also known as the Swiss Cheese Plant, is famous for '
        'its large, perforated leaves. It is a fast-growing plant that '
        'can add a tropical feel to any space. Monstera prefers bright, '
        'indirect light and should be watered when the top inch of soil '
        'is dry.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  bostonFern(
    id: 'bostonFern',
    localUrl: 'assets/images/popular_plants/boston_fern.png',
    title: 'Boston Fern',
    description: 'Classic shade-loving hanging plant.',
    largeDescription:
        'Boston Ferns are classic houseplants known for their lush, '
        'feathery fronds. They thrive in humid environments and '
        'prefer indirect light. Regular misting and watering are '
        'essential to keep the Boston Fern healthy and vibrant.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  echeveria(
    id: 'echeveria',
    localUrl: 'assets/images/popular_plants/echeveria.png',
    title: 'Echeveria',
    description: 'Perfect for forgetful waterers.',
    largeDescription:
        'Echeveria is a popular succulent known for its rosette shape '
        'and vibrant colors. It requires minimal care and is perfect '
        'for those who tend to forget to water their plants. Echeveria '
        'thrives in bright light and should be watered sparingly.',
    category: Category.succulentsAndCacti,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  cereusCactus(
    id: 'cereusCactus',
    localUrl: 'assets/images/popular_plants/cereus_cactus.png',
    title: 'Cereus Cactus',
    description: 'Sun-loving and very resilient.',
    largeDescription:
        'The Cereus Cactus is a sun-loving plant that is extremely '
        'resilient and easy to care for. It is known for its tall, '
        'columnar shape and can produce beautiful night-blooming '
        'flowers. The Cereus Cactus prefers well-draining soil and '
        'should be watered infrequently.',
    category: Category.succulentsAndCacti,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  anthurium(
    id: 'anthurium',
    localUrl: 'assets/images/popular_plants/anthurium.png',
    title: 'Anthurium',
    description: 'Tropical plant with striking flowers.',
    largeDescription:
        'Anthuriums are tropical plants known for their striking, '
        'heart-shaped flowers and glossy leaves. They thrive in warm, '
        'humid environments and prefer bright, indirect light. '
        'Anthuriums should be watered regularly to keep the soil '
        'moist but not soggy.',
    category: Category.flowering,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  ),
  pilea(
    id: 'pilea',
    localUrl: 'assets/images/popular_plants/pilea.png',
    title: 'Pilea Peperomioides',
    description: 'Highly popular in modern décor.',
    largeDescription:
        'Pilea Peperomioides, also known as the Chinese Money Plant, '
        'is highly popular in modern décor for its unique, round '
        'leaves. It is easy to care for and thrives in bright, '
        'indirect light. Pilea should be watered when the soil '
        'is dry to the touch.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.nonToxic,
  );

  const PopularPlant({
    required this.id,
    required this.localUrl,
    required this.title,
    required this.description,
    required this.largeDescription,
    required this.category,
    this.maintenanceDifficulty,
    this.wateringNeeds,
    this.lightNeeds,
    this.toxicity,
  });

  final String id;
  final String localUrl;
  final String title;
  final String description;
  final String largeDescription;
  final Category category;
  final PlantMaintenanceDifficulty? maintenanceDifficulty;
  final WateringNeeds? wateringNeeds;
  final LightNeeds? lightNeeds;
  final ToxicityLevel? toxicity;
}
