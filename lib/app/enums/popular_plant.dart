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
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    maintenanceDescription: 'Pothos are incredibly easy to care for, '
        'known for their resilient nature. They '
        'thrive in a variety of lighting conditions '
        'and only need occasional watering.',
    wateringNeeds: WateringNeeds.medium,
    wateringDescription: 'Water the Pothos when the top 2-3 cm of '
        'the soil feel dry to the touch. Typically, '
        'they require watering every 7 to 10 days, '
        'depending on temperature and humidity.',
    wateringFrequencyDays: 8,
    wateringMoistureThreshold: 40,
    lightNeeds: LightNeeds.medium,
    lightDescription: 'Pothos thrive in bright, indirect light '
        'but can also tolerate low light. However, '
        'they may grow more slowly in low light '
        'conditions.',
    toxicity: ToxicityLevel.toxic,
    toxicityDescription: 'Pothos are toxic to pets and humans if '
        'ingested, causing symptoms like vomiting '
        'or oral irritation.',
  ),
  snakePlant(
    id: 'snakePlant',
    localUrl: 'assets/images/popular_plants/snake_plant.png',
    title: 'Snake Plant',
    description: 'Air-purifying and low maintenance.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    maintenanceDescription: 'Snake Plants are incredibly hardy and '
        'thrive on minimal care. They are drought-tolerant, '
        'adaptable to various lighting conditions, and ideal '
        'for busy or beginner plant owners.',
    wateringNeeds: WateringNeeds.low,
    wateringDescription: 'Water the Snake Plant only when the soil '
        'is completely dry, typically every 14 to 21 days. '
        'Overwatering should be avoided to prevent '
        'root rot.',
    wateringFrequencyDays: 17,
    wateringMoistureThreshold: 25,
    lightNeeds: LightNeeds.low,
    lightDescription: 'Snake Plants prefer bright, indirect '
        'light but can tolerate low-light and '
        'even some direct sunlight, making them '
        'highly versatile indoors.',
    toxicity: ToxicityLevel.toxic,
    toxicityDescription: 'Snake Plants are toxic to pets and '
        'humans if ingested, potentially causing '
        'nausea or gastrointestinal upset.',
  ),
  zzPlant(
    id: 'zzPlant',
    localUrl: 'assets/images/popular_plants/zz_plant.png',
    title: 'ZZ Plant',
    description: 'Great for low-light areas.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    wateringNeeds: WateringNeeds.low,
    lightNeeds: LightNeeds.low,
    toxicity: ToxicityLevel.toxic,
    maintenanceDescription: 'ZZ Plants are extremely low-maintenance '
        'and perfect for beginners. They tolerate '
        'neglect, low light, and infrequent watering '
        'with ease.',
    wateringDescription: 'Allow the soil to dry out completely '
        'between waterings. Water approximately '
        'every 14 to 21 days, depending on the '
        'environment and season.',
    wateringFrequencyDays: 17,
    wateringMoistureThreshold: 30,
    lightDescription: 'ZZ Plants thrive in low to medium '
        'indirect light but can also tolerate '
        'low-light environments, making them '
        'ideal for indoor spaces with limited '
        'natural light.',
    toxicityDescription: 'ZZ Plants are toxic to pets and '
        'humans if ingested, causing irritation '
        'or stomach discomfort.',
  ),
  peaceLily(
    id: 'peaceLily',
    localUrl: 'assets/images/popular_plants/peace_lily.png',
    title: 'Peace Lily',
    description: 'Blooms indoors and purifies air.',
    category: Category.flowering,
    maintenanceDifficulty: PlantMaintenanceDifficulty.medium,
    maintenanceDescription: 'Peace Lilies are fairly easy to care for, '
        'requiring consistent moisture and thriving '
        'in lower light conditions. They benefit from '
        'regular watering and occasional misting to '
        'maintain humidity.',
    wateringNeeds: WateringNeeds.medium,
    wateringDescription: 'Water the Peace Lily when the top of '
        'the soil starts to dry out, usually once '
        'every 5 to 7 days. Ensure the soil remains '
        'slightly moist but not soggy.',
    wateringFrequencyDays: 6,
    wateringMoistureThreshold: 50,
    lightNeeds: LightNeeds.low,
    lightDescription: 'Peace Lilies do well in low to medium '
        'indirect light and can tolerate lower '
        'light environments better than many other '
        'houseplants.',
    toxicity: ToxicityLevel.nonToxic,
    toxicityDescription: 'Peace Lilies are toxic to pets and '
        'humans if ingested, potentially causing '
        'oral irritation and digestive upset.',
  ),
  monstera(
    id: 'monstera',
    localUrl: 'assets/images/popular_plants/monstera.png',
    title: 'Monstera',
    description: 'Exotic and highly decorative foliage.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.medium,
    maintenanceDescription: 'Monstera plants are relatively easy to '
        'care for but require regular attention '
        'to watering and light. They thrive in '
        'humid environments with moderate '
        'maintenance.',
    wateringNeeds: WateringNeeds.medium,
    wateringDescription: 'Water the Monstera when the top 2-5 cm '
        'of soil feel dry to the touch. Typically, '
        'watering is needed every 7 to 10 days '
        'depending on the environment.',
    wateringFrequencyDays: 8,
    wateringMoistureThreshold: 45,
    lightNeeds: LightNeeds.medium,
    lightDescription: 'Monstera prefers bright, indirect light '
        'but can tolerate lower light levels. '
        'Direct sunlight should be avoided to '
        'prevent leaf scorching.',
    toxicity: ToxicityLevel.toxic,
    toxicityDescription: 'Monstera plants are toxic to pets '
        'and humans if ingested, causing irritation '
        'and digestive upset.',
  ),
  bostonFern(
    id: 'bostonFern',
    localUrl: 'assets/images/popular_plants/boston_fern.png',
    title: 'Boston Fern',
    description: 'Classic shade-loving hanging plant.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.medium,
    wateringNeeds: WateringNeeds.medium,
    lightNeeds: LightNeeds.medium,
    toxicity: ToxicityLevel.nonToxic,
    maintenanceDescription: 'Boston Ferns require a bit more attention, '
        'thriving in consistently moist soil and '
        'high humidity environments. Regular misting '
        'and attentive watering help them stay lush '
        'and healthy.',
    wateringDescription: 'Keep the soil consistently moist but '
        'not soggy. Water the Boston Fern every '
        '3 to 5 days, adjusting based on the '
        'humidity and temperature.',
    wateringFrequencyDays: 4,
    wateringMoistureThreshold: 55,
    lightDescription: 'Boston Ferns prefer bright, indirect '
        'light and can tolerate some shade. '
        'Direct sunlight should be avoided to '
        'prevent leaf burn.',
    toxicityDescription: 'Boston Ferns are non-toxic to pets '
        'and humans, making them a safe option for '
        'households with animals.',
  ),
  echeveria(
    id: 'echeveria',
    localUrl: 'assets/images/popular_plants/echeveria.png',
    title: 'Echeveria',
    description: 'Perfect for forgetful waterers.',
    category: Category.succulentsAndCacti,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    maintenanceDescription: 'Echeverias are low-maintenance succulents '
        'that thrive with minimal care, requiring '
        'only occasional watering and plenty of light '
        'to stay healthy and vibrant.',
    wateringNeeds: WateringNeeds.low,
    wateringDescription: 'Allow the soil to dry out completely '
        'before watering Echeveria thoroughly. '
        'Typically, it needs watering every '
        '14 to 21 days depending on the climate '
        'and season.',
    wateringFrequencyDays: 18,
    wateringMoistureThreshold: 35,
    lightNeeds: LightNeeds.high,
    lightDescription: 'Echeverias prefer bright, direct '
        'sunlight for several hours a day. '
        'A sunny windowsill or outdoor spot '
        'with strong light is ideal for their growth.',
    toxicity: ToxicityLevel.nonToxic,
    toxicityDescription: 'Echeverias are non-toxic to pets '
        'and humans, making them a safe and '
        'attractive choice for indoor spaces.',
  ),
  cereusCactus(
    id: 'cereusCactus',
    localUrl: 'assets/images/popular_plants/cereus_cactus.png',
    title: 'Cereus Cactus',
    description: 'Sun-loving and very resilient.',
    category: Category.succulentsAndCacti,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    maintenanceDescription: 'Cereus Cactus is a low-maintenance '
        'plant that thrives in dry conditions '
        'and requires minimal attention, making '
        'it ideal for beginners or busy owners.',
    wateringNeeds: WateringNeeds.low,
    wateringDescription: 'Water the Cereus Cactus deeply but '
        'infrequently, allowing the soil to '
        'dry out completely between waterings. '
        'Typically, it needs watering every '
        '21 to 30 days.',
    wateringFrequencyDays: 25,
    wateringMoistureThreshold: 30,
    lightNeeds: LightNeeds.high,
    lightDescription: 'Cereus Cactus loves full sun and '
        'should be placed in a bright, sunny '
        'spot to grow vigorously and maintain '
        'its shape.',
    toxicity: ToxicityLevel.nonToxic,
    toxicityDescription: 'Cereus Cactus is generally considered '
        'non-toxic to pets and humans, although '
        'its sharp spines can cause physical '
        'injury if touched.',
  ),
  anthurium(
    id: 'anthurium',
    localUrl: 'assets/images/popular_plants/anthurium.png',
    title: 'Anthurium',
    description: 'Tropical plant with striking flowers.',
    category: Category.flowering,
    maintenanceDifficulty: PlantMaintenanceDifficulty.medium,
    maintenanceDescription: 'Anthuriums require moderate care, '
        'thriving with consistent moisture '
        'and warm, humid environments. They '
        'prefer a stable routine and occasional '
        'attention to keep their foliage and '
        'blooms healthy.',
    wateringNeeds: WateringNeeds.medium,
    wateringDescription: 'Water the Anthurium when the top '
        '2-3 cm of soil feel dry, keeping the '
        'soil slightly moist but never soggy. '
        'It typically needs watering every '
        '7 to 10 days depending on the '
        'environment.',
    wateringFrequencyDays: 8,
    wateringMoistureThreshold: 60,
    lightNeeds: LightNeeds.medium,
    lightDescription: 'Anthuriums prefer bright, indirect '
        'light and will struggle in direct '
        'sun or very low light conditions. '
        'A spot near a bright window with filtered '
        'light is ideal.',
    toxicity: ToxicityLevel.toxic,
    toxicityDescription: 'Anthuriums are toxic to pets and '
        'humans if ingested, causing oral '
        'irritation and digestive discomfort.',
  ),
  pilea(
    id: 'pilea',
    localUrl: 'assets/images/popular_plants/pilea.png',
    title: 'Pilea Peperomioides',
    description: 'Highly popular in modern décor.',
    category: Category.foliage,
    maintenanceDifficulty: PlantMaintenanceDifficulty.easy,
    maintenanceDescription: 'The Pilea Peperomioides is a low-maintenance '
        'plant that thrives with minimal attention, '
        'making it perfect for beginners.',
    wateringNeeds: WateringNeeds.low,
    wateringDescription: 'Water the Pilea every two weeks or when '
        'the top layer of soil feels dry, ensuring '
        'the roots do not sit in water.',
    wateringFrequencyDays: 14,
    wateringMoistureThreshold: 50,
    lightNeeds: LightNeeds.medium,
    lightDescription: 'Pilea prefers bright, indirect light but '
        'can tolerate lower light conditions for short periods.',
    toxicity: ToxicityLevel.nonToxic,
    toxicityDescription: 'Pilea Peperomioides is non-toxic and '
        'safe for pets and humans, making it a '
        'great choice for households with animals.',
  );

  const PopularPlant({
    required this.id,
    required this.localUrl,
    required this.title,
    required this.description,
    required this.category,
    required this.maintenanceDifficulty,
    required this.maintenanceDescription,
    required this.wateringNeeds,
    required this.wateringDescription,
    required this.wateringFrequencyDays,
    required this.wateringMoistureThreshold,
    required this.lightNeeds,
    required this.lightDescription,
    required this.toxicity,
    required this.toxicityDescription,
  });

  final String id;
  final String localUrl;
  final String title;
  final String description;
  final Category category;
  final PlantMaintenanceDifficulty maintenanceDifficulty;
  final String maintenanceDescription;
  final WateringNeeds wateringNeeds;
  final String wateringDescription;
  final int wateringFrequencyDays;
  final int wateringMoistureThreshold;
  final LightNeeds lightNeeds;
  final String lightDescription;
  final ToxicityLevel toxicity;
  final String toxicityDescription;
}
