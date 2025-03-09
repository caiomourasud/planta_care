// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_sub_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantSubLocationModel _$PlantSubLocationModelFromJson(
        Map<String, dynamic> json) =>
    _PlantSubLocationModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      plantLocationType: $enumDecodeNullable(
          _$PlantLocationTypeEnumMap, json['plantLocationType']),
    );

Map<String, dynamic> _$PlantSubLocationModelToJson(
        _PlantSubLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'plantLocationType':
          _$PlantLocationTypeEnumMap[instance.plantLocationType],
    };

const _$PlantLocationTypeEnumMap = {
  PlantLocationType.indoor: 'indoor',
  PlantLocationType.outdoor: 'outdoor',
  PlantLocationType.both: 'both',
};
