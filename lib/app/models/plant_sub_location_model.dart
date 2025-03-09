import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';

part 'plant_sub_location_model.freezed.dart';
part 'plant_sub_location_model.g.dart';

@freezed
abstract class PlantSubLocationModel with _$PlantSubLocationModel {
  const factory PlantSubLocationModel({
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    PlantLocationType? plantLocationType,
  }) = _PlantSubLocationModel;

  factory PlantSubLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PlantSubLocationModelFromJson(json);
}
