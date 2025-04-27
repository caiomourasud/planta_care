import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/light_needs.dart';
import 'package:planta_care/app/enums/plant_maintenance_difficult.dart';
import 'package:planta_care/app/enums/toxicity_level.dart';
import 'package:planta_care/app/enums/watering_needs.dart';

part 'plant_care_model.freezed.dart';
part 'plant_care_model.g.dart';

@freezed
abstract class PlantCare with _$PlantCare {
  @JsonSerializable()
  const factory PlantCare({
    @Default(PlantMaintenanceDifficulty.easy)
    PlantMaintenanceDifficulty? maintenanceDifficulty,
    String? maintenanceDescription,
    @Default(WateringNeeds.low) WateringNeeds? wateringNeeds,
    String? wateringDescription,
    @Default(0) int? wateringFrequencyDays,
    @Default(0) int? wateringMoistureThreshold,
    @Default(LightNeeds.low) LightNeeds? lightNeeds,
    String? lightDescription,
    @Default(ToxicityLevel.toxic) ToxicityLevel? toxicity,
    String? toxicityDescription,
  }) = _PlantCare;

  factory PlantCare.fromJson(Map<String, dynamic> json) =>
      _$PlantCareFromJson(json);
}
