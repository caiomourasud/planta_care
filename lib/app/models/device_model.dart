import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/converters/light_level_converter.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/app/services/device_service.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    List<DeviceReadingModel>? readings,
    @LightLevelConverter() double? light,
    double? moisture,
    DateTime? timestamp,
    double? temperature,
    double? humidity,
    bool? realTimeEnabled,
  }) = _DeviceModel;

  const DeviceModel._();
  String get lightLevel => DeviceService.getLightLevel(light);

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}
