// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_care_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantCare _$PlantCareFromJson(Map<String, dynamic> json) => _PlantCare(
      maintenanceDifficulty: $enumDecodeNullable(
              _$PlantMaintenanceDifficultyEnumMap,
              json['maintenanceDifficulty']) ??
          PlantMaintenanceDifficulty.easy,
      maintenanceDescription: json['maintenanceDescription'] as String?,
      wateringNeeds:
          $enumDecodeNullable(_$WateringNeedsEnumMap, json['wateringNeeds']) ??
              WateringNeeds.low,
      wateringDescription: json['wateringDescription'] as String?,
      wateringFrequencyDays:
          (json['wateringFrequencyDays'] as num?)?.toInt() ?? 0,
      wateringMoistureThreshold:
          (json['wateringMoistureThreshold'] as num?)?.toInt() ?? 0,
      lightNeeds:
          $enumDecodeNullable(_$LightNeedsEnumMap, json['lightNeeds']) ??
              LightNeeds.low,
      lightDescription: json['lightDescription'] as String?,
      toxicity: $enumDecodeNullable(_$ToxicityLevelEnumMap, json['toxicity']) ??
          ToxicityLevel.toxic,
      toxicityDescription: json['toxicityDescription'] as String?,
    );

Map<String, dynamic> _$PlantCareToJson(_PlantCare instance) =>
    <String, dynamic>{
      'maintenanceDifficulty':
          _$PlantMaintenanceDifficultyEnumMap[instance.maintenanceDifficulty],
      'maintenanceDescription': instance.maintenanceDescription,
      'wateringNeeds': _$WateringNeedsEnumMap[instance.wateringNeeds],
      'wateringDescription': instance.wateringDescription,
      'wateringFrequencyDays': instance.wateringFrequencyDays,
      'wateringMoistureThreshold': instance.wateringMoistureThreshold,
      'lightNeeds': _$LightNeedsEnumMap[instance.lightNeeds],
      'lightDescription': instance.lightDescription,
      'toxicity': _$ToxicityLevelEnumMap[instance.toxicity],
      'toxicityDescription': instance.toxicityDescription,
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
