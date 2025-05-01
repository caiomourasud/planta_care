// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantActivity _$PlantActivityFromJson(Map<String, dynamic> json) =>
    _PlantActivity(
      id: json['id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      actionType:
          $enumDecodeNullable(_$PlantActivityTypeEnumMap, json['actionType']),
      actionDate: json['actionDate'] == null
          ? null
          : DateTime.parse(json['actionDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$PlantActivityToJson(_PlantActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'actionType': _$PlantActivityTypeEnumMap[instance.actionType],
      'actionDate': instance.actionDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'notes': instance.notes,
    };

const _$PlantActivityTypeEnumMap = {
  PlantActivityType.watering: 'watering',
  PlantActivityType.fertilizing: 'fertilizing',
  PlantActivityType.note: 'note',
  PlantActivityType.image: 'image',
};
