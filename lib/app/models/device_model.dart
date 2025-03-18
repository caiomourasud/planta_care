import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/models/device_reading_model.dart';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

@freezed
abstract class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    required String id,
    List<DeviceReadingModel>? readings,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);
}
