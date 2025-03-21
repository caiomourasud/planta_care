// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => _DeviceModel(
      readings: (json['readings'] as List<dynamic>?)
          ?.map((e) => DeviceReadingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      light: json['light'] as String?,
      moisture: (json['moisture'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      realTimeEnabled: json['realTimeEnabled'] as bool?,
    );

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'readings': instance.readings,
      'light': instance.light,
      'moisture': instance.moisture,
      'timestamp': instance.timestamp?.toIso8601String(),
      'realTimeEnabled': instance.realTimeEnabled,
    };
