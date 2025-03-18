// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceReadingModel _$DeviceReadingModelFromJson(Map<String, dynamic> json) =>
    _DeviceReadingModel(
      light: json['light'] as String?,
      moisture: (json['moisture'] as num?)?.toInt(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$DeviceReadingModelToJson(_DeviceReadingModel instance) =>
    <String, dynamic>{
      'light': instance.light,
      'moisture': instance.moisture,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
