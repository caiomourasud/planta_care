import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/models/device_reading_model.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    List<DeviceReadingModel>? readings,
    // String? light,
    double? moisture,
    DateTime? timestamp,
    double? temperature,
    double? humidity,
    bool? realTimeEnabled,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}
