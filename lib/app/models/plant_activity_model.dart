import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_activity_model.freezed.dart';
part 'plant_activity_model.g.dart';

enum PlantActivityType {
  watering,
  fertilizing,
  note,
  image,
}

@freezed
abstract class PlantActivity with _$PlantActivity {
  const factory PlantActivity({
    String? id,
    String? title,
    String? image,
    PlantActivityType? actionType,
    DateTime? createdAt,
    String? notes,
  }) = _PlantActivity;

  factory PlantActivity.fromJson(Map<String, dynamic> json) =>
      _$PlantActivityFromJson(json);
}
