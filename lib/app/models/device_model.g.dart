// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => _DeviceModel(
      readings: (json['readings'] as List<dynamic>?)
          ?.map((e) => DeviceReadingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      moisture: (json['moisture'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      realTimeEnabled: json['realTimeEnabled'] as bool?,
    );

Map<String, dynamic> _$DeviceModelToJson(_DeviceModel instance) =>
    <String, dynamic>{
      'readings': instance.readings,
      'moisture': instance.moisture,
      'timestamp': instance.timestamp?.toIso8601String(),
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'realTimeEnabled': instance.realTimeEnabled,
    };
