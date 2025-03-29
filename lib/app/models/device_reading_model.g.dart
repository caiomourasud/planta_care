// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceReadingModel _$DeviceReadingModelFromJson(Map<String, dynamic> json) =>
    _DeviceReadingModel(
      moisture: (json['moisture'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DeviceReadingModelToJson(_DeviceReadingModel instance) =>
    <String, dynamic>{
      'moisture': instance.moisture,
      'timestamp': instance.timestamp?.toIso8601String(),
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };
