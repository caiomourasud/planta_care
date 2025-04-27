import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/converters/light_level_converter.dart';
import 'package:planta_care/app/services/device_service.dart';
import 'package:planta_care/app/services/plant_data_service.dart';

part 'device_reading_model.freezed.dart';
part 'device_reading_model.g.dart';

@freezed
abstract class DeviceReadingModel with _$DeviceReadingModel {
  const factory DeviceReadingModel({
    @LightLevelConverter() double? light,
    double? moisture,
    DateTime? timestamp,
    double? temperature,
    double? humidity,
  }) = _DeviceReadingModel;

  const DeviceReadingModel._();
  String get lightLevel => DeviceService.getLightLevel(light);

  double get moisturePercentage =>
      PlantDataService.convertMoistureLevelInPercentage(moisture ?? 0.0);

  factory DeviceReadingModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceReadingModelFromJson(json);
}
