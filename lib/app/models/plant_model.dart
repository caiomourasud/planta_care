// lib/app/models/plant_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_model.freezed.dart';
part 'plant_model.g.dart';

@freezed
abstract class PlantModel with _$PlantModel {
  const factory PlantModel({
    int? id,
    @JsonKey(name: 'common_name') String? commonName,
    @JsonKey(name: 'scientific_name') List<String>? scientificName,
    @JsonKey(name: 'other_name') List<String>? otherName,
    String? family,
    String? genus,
    List<String>? origin,
    String? type,
    List<Dimensions>? dimensions,
    String? cycle,
    String? watering,
    @JsonKey(
      name: 'watering_general_benchmark',
      fromJson: _wateringBenchmarkFromJson,
      toJson: _wateringBenchmarkToJson,
    )
    WateringBenchmark? wateringGeneralBenchmark,
    @JsonKey(name: 'plant_anatomy') List<PlantAnatomy>? plantAnatomy,
    List<String>? sunlight,
    @JsonKey(name: 'pruning_month') List<String>? pruningMonth,
    PruningCount? pruningCount,
    bool? seeds,
    List<String>? attracts,
    List<String>? propagation,
    Hardiness? hardiness,
    @JsonKey(name: 'hardiness_location') HardinessLocation? hardinessLocation,
    bool? flowers,
    @JsonKey(name: 'flowering_season') String? floweringSeason,
    List<String>? soil,
    @JsonKey(name: 'pest_susceptibility') List<String>? pestSusceptibility,
    bool? cones,
    bool? fruits,
    @JsonKey(name: 'edible_fruit') bool? edibleFruit,
    @JsonKey(name: 'fruiting_season') String? fruitingSeason,
    @JsonKey(name: 'harvest_season') String? harvestSeason,
    @JsonKey(name: 'harvest_method') String? harvestMethod,
    bool? leaf,
    @JsonKey(name: 'edible_leaf') bool? edibleLeaf,
    @JsonKey(name: 'growth_rate') String? growthRate,
    String? maintenance,
    bool? medicinal,
    @JsonKey(name: 'poisonous_to_humans') bool? poisonousToHumans,
    @JsonKey(name: 'poisonous_to_pets') bool? poisonousToPets,
    @JsonKey(name: 'drought_tolerant') bool? droughtTolerant,
    @JsonKey(name: 'salt_tolerant') bool? saltTolerant,
    bool? thorny,
    bool? invasive,
    bool? rare,
    bool? tropical,
    bool? cuisine,
    bool? indoor,
    @JsonKey(name: 'care_level') String? careLevel,
    String? description,
    @JsonKey(name: 'default_image') ImageData? defaultImage,
    @JsonKey(name: 'care_guides') String? careGuides,
  }) = _PlantModel;

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);

  factory PlantModel.fromSearchResult({
    int? id,
    String? commonName,
    List<String>? scientificName,
    List<String>? otherName,
    String? family,
    String? genus,
    ImageData? defaultImage,
  }) {
    return PlantModel(
      id: id,
      commonName: commonName,
      scientificName: scientificName,
      otherName: otherName,
      family: family,
      genus: genus,
      defaultImage: defaultImage,
    );
  }
}

@freezed
abstract class Dimensions with _$Dimensions {
  const factory Dimensions({
    String? type,
    double? minValue,
    double? maxValue,
    String? unit,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}

@freezed
abstract class WateringBenchmark with _$WateringBenchmark {
  const factory WateringBenchmark({
    double? minValue,
    double? maxValue,
    String? unit,
  }) = _WateringBenchmark;

  factory WateringBenchmark.fromJson(Map<String, dynamic> json) {
    final value = json['value'] as String?;
    double? minValue;
    double? maxValue;

    if (value != null) {
      final values = value.split('-');
      if (values.length == 2) {
        minValue = double.tryParse(values[0]);
        maxValue = double.tryParse(values[1]);
      }
    }

    return WateringBenchmark(
      minValue: minValue,
      maxValue: maxValue,
      unit: json['unit'] as String?,
    );
  }
}

WateringBenchmark _wateringBenchmarkFromJson(Map<String, dynamic> json) {
  final value = json['value'] as String?;
  double? minValue;
  double? maxValue;

  if (value != null) {
    final values = value.split('-');
    if (values.length == 2) {
      minValue = double.tryParse(values[0]);
      maxValue = double.tryParse(values[1]);
    }
  }

  return WateringBenchmark(
    minValue: minValue,
    maxValue: maxValue,
    unit: json['unit'] as String?,
  );
}

// Função para converter de WateringBenchmark para JSON
Map<String, dynamic> _wateringBenchmarkToJson(WateringBenchmark? benchmark) {
  if (benchmark == null) return {};

  return {
    'value': '${benchmark.minValue}-${benchmark.maxValue}',
    'unit': benchmark.unit,
  };
}

@freezed
abstract class PlantAnatomy with _$PlantAnatomy {
  const factory PlantAnatomy({
    String? part,
    List<String>? color,
  }) = _PlantAnatomy;

  factory PlantAnatomy.fromJson(Map<String, dynamic> json) =>
      _$PlantAnatomyFromJson(json);
}

@freezed
abstract class PruningCount with _$PruningCount {
  const factory PruningCount({
    int? amount,
    String? interval,
  }) = _PruningCount;

  factory PruningCount.fromJson(Map<String, dynamic> json) =>
      _$PruningCountFromJson(json);
}

@freezed
abstract class Hardiness with _$Hardiness {
  const factory Hardiness({
    String? min,
    String? max,
  }) = _Hardiness;

  factory Hardiness.fromJson(Map<String, dynamic> json) =>
      _$HardinessFromJson(json);
}

@freezed
abstract class HardinessLocation with _$HardinessLocation {
  const factory HardinessLocation({
    String? fullUrl,
    String? fullIframe,
  }) = _HardinessLocation;

  factory HardinessLocation.fromJson(Map<String, dynamic> json) =>
      _$HardinessLocationFromJson(json);
}

@freezed
abstract class ImageData with _$ImageData {
  const factory ImageData({
    int? license,
    String? licenseName,
    String? licenseUrl,
    String? originalUrl,
    String? regularUrl,
    String? mediumUrl,
    String? smallUrl,
    String? thumbnail,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);
}
