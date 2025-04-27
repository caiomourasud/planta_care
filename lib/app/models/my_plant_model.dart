import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/enums/last_watered.dart';
import 'package:planta_care/app/enums/plant_health_status.dart';
import 'package:planta_care/app/models/plant_care_model.dart';

part 'my_plant_model.freezed.dart';
part 'my_plant_model.g.dart';

@freezed
abstract class MyPlantModel with _$MyPlantModel {
  @JsonSerializable()
  const factory MyPlantModel({
    String? id,
    String? name,
    String? description,
    List<String>? images,
    LastWatered? lastWatered,
    DateTime? lastWatering,
    DateTime? lastFertilization,
    String? deviceId,
    DateTime? deviceAddedAt,
    String? locationId,
    int? plantId,
    PlantHealthStatus? healthStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
    String? localUrl,
    PlantCare? plantCare,
  }) = _MyPlantModel;

  factory MyPlantModel.fromJson(Map<String, dynamic> json) =>
      _$MyPlantModelFromJson(json);
}
