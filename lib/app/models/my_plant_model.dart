import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/enums/last_watered.dart';
import 'package:planta_care/app/enums/light_needs.dart';
import 'package:planta_care/app/enums/plant_health_status.dart';
import 'package:planta_care/app/enums/plant_maintenance_difficult.dart';
import 'package:planta_care/app/enums/toxicity_level.dart';
import 'package:planta_care/app/enums/watering_needs.dart';

part 'my_plant_model.freezed.dart';
part 'my_plant_model.g.dart';

@freezed
abstract class MyPlantModel with _$MyPlantModel {
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
    @Default(PlantMaintenanceDifficulty.easy)
    PlantMaintenanceDifficulty? maintenanceDifficulty,
    @Default(WateringNeeds.low) WateringNeeds? wateringNeeds,
    @Default(LightNeeds.low) LightNeeds? lightNeeds,
    @Default(ToxicityLevel.nonToxic) ToxicityLevel? toxicity,
  }) = _MyPlantModel;

  factory MyPlantModel.fromJson(Map<String, dynamic> json) =>
      _$MyPlantModelFromJson(json);
}
