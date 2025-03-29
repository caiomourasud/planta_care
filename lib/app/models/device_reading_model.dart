import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_reading_model.freezed.dart';
part 'device_reading_model.g.dart';

@freezed
abstract class DeviceReadingModel with _$DeviceReadingModel {
  const factory DeviceReadingModel({
    // String? light,
    double? moisture,
    DateTime? timestamp,
    double? temperature,
    double? humidity,
  }) = _DeviceReadingModel;

  factory DeviceReadingModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceReadingModelFromJson(json);
}
