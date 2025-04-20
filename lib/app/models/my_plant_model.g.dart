// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyPlantModel _$MyPlantModelFromJson(Map<String, dynamic> json) =>
    _MyPlantModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lastWatered:
          $enumDecodeNullable(_$LastWateredEnumMap, json['lastWatered']),
      lastWatering: json['lastWatering'] == null
          ? null
          : DateTime.parse(json['lastWatering'] as String),
      lastFertilization: json['lastFertilization'] == null
          ? null
          : DateTime.parse(json['lastFertilization'] as String),
      deviceId: json['deviceId'] as String?,
      deviceAddedAt: json['deviceAddedAt'] == null
          ? null
          : DateTime.parse(json['deviceAddedAt'] as String),
      locationId: json['locationId'] as String?,
      plantId: (json['plantId'] as num?)?.toInt(),
      healthStatus:
          $enumDecodeNullable(_$PlantHealthStatusEnumMap, json['healthStatus']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
      localUrl: json['localUrl'] as String?,
      maintenanceDifficulty: $enumDecodeNullable(
              _$PlantMaintenanceDifficultyEnumMap,
              json['maintenanceDifficulty']) ??
          PlantMaintenanceDifficulty.easy,
      wateringNeeds:
          $enumDecodeNullable(_$WateringNeedsEnumMap, json['wateringNeeds']) ??
              WateringNeeds.low,
      lightNeeds:
          $enumDecodeNullable(_$LightNeedsEnumMap, json['lightNeeds']) ??
              LightNeeds.low,
      toxicity: $enumDecodeNullable(_$ToxicityLevelEnumMap, json['toxicity']) ??
          ToxicityLevel.nonToxic,
    );

Map<String, dynamic> _$MyPlantModelToJson(_MyPlantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'lastWatered': _$LastWateredEnumMap[instance.lastWatered],
      'lastWatering': instance.lastWatering?.toIso8601String(),
      'lastFertilization': instance.lastFertilization?.toIso8601String(),
      'deviceId': instance.deviceId,
      'deviceAddedAt': instance.deviceAddedAt?.toIso8601String(),
      'locationId': instance.locationId,
      'plantId': instance.plantId,
      'healthStatus': _$PlantHealthStatusEnumMap[instance.healthStatus],
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'category': _$CategoryEnumMap[instance.category],
      'localUrl': instance.localUrl,
      'maintenanceDifficulty':
          _$PlantMaintenanceDifficultyEnumMap[instance.maintenanceDifficulty],
      'wateringNeeds': _$WateringNeedsEnumMap[instance.wateringNeeds],
      'lightNeeds': _$LightNeedsEnumMap[instance.lightNeeds],
      'toxicity': _$ToxicityLevelEnumMap[instance.toxicity],
    };

const _$LastWateredEnumMap = {
  LastWatered.today: 'today',
  LastWatered.yesterday: 'yesterday',
  LastWatered.threeFourDaysAgo: 'threeFourDaysAgo',
  LastWatered.aboutOneWeekAgo: 'aboutOneWeekAgo',
  LastWatered.twoWeeksOrMoreAgo: 'twoWeeksOrMoreAgo',
};

const _$PlantHealthStatusEnumMap = {
  PlantHealthStatus.healthy: 'healthy',
  PlantHealthStatus.needsAttention: 'needsAttention',
  PlantHealthStatus.sick: 'sick',
  PlantHealthStatus.dying: 'dying',
};

const _$CategoryEnumMap = {
  Category.foliage: 'foliage',
  Category.flowering: 'flowering',
  Category.succulentsAndCacti: 'succulentsAndCacti',
  Category.aromatics: 'aromatics',
  Category.trees: 'trees',
  Category.shrubs: 'shrubs',
  Category.vegetables: 'vegetables',
  Category.herbs: 'herbs',
};

const _$PlantMaintenanceDifficultyEnumMap = {
  PlantMaintenanceDifficulty.easy: 'easy',
  PlantMaintenanceDifficulty.medium: 'medium',
  PlantMaintenanceDifficulty.hard: 'hard',
};

const _$WateringNeedsEnumMap = {
  WateringNeeds.low: 'low',
  WateringNeeds.medium: 'medium',
  WateringNeeds.high: 'high',
};

const _$LightNeedsEnumMap = {
  LightNeeds.low: 'low',
  LightNeeds.medium: 'medium',
  LightNeeds.high: 'high',
};

const _$ToxicityLevelEnumMap = {
  ToxicityLevel.nonToxic: 'nonToxic',
  ToxicityLevel.toxic: 'toxic',
};
