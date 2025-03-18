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
      'locationId': instance.locationId,
      'plantId': instance.plantId,
      'healthStatus': _$PlantHealthStatusEnumMap[instance.healthStatus],
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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
