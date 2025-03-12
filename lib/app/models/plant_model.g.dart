// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantModel _$PlantModelFromJson(Map<String, dynamic> json) => _PlantModel(
      id: (json['id'] as num?)?.toInt(),
      commonName: json['common_name'] as String?,
      scientificName: (json['scientific_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      otherName: (json['other_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      family: json['family'] as String?,
      genus: json['genus'] as String?,
      origin:
          (json['origin'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      dimensions: (json['dimensions'] as List<dynamic>?)
          ?.map((e) => Dimensions.fromJson(e as Map<String, dynamic>))
          .toList(),
      cycle: json['cycle'] as String?,
      watering: json['watering'] as String?,
      wateringGeneralBenchmark: json['watering_general_benchmark'] == null
          ? null
          : WateringBenchmark.fromJson(
              json['watering_general_benchmark'] as Map<String, dynamic>),
      plantAnatomy: (json['plant_anatomy'] as List<dynamic>?)
          ?.map((e) => PlantAnatomy.fromJson(e as Map<String, dynamic>))
          .toList(),
      sunlight: (json['sunlight'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pruningMonth: (json['pruning_month'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pruningCount: json['pruningCount'] == null
          ? null
          : PruningCount.fromJson(json['pruningCount'] as Map<String, dynamic>),
      seeds: json['seeds'] as bool?,
      attracts: (json['attracts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      propagation: (json['propagation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hardiness: json['hardiness'] == null
          ? null
          : Hardiness.fromJson(json['hardiness'] as Map<String, dynamic>),
      hardinessLocation: json['hardiness_location'] == null
          ? null
          : HardinessLocation.fromJson(
              json['hardiness_location'] as Map<String, dynamic>),
      flowers: json['flowers'] as bool?,
      floweringSeason: json['flowering_season'] as String?,
      soil: (json['soil'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pestSusceptibility: (json['pest_susceptibility'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cones: json['cones'] as bool?,
      fruits: json['fruits'] as bool?,
      edibleFruit: json['edible_fruit'] as bool?,
      fruitingSeason: json['fruiting_season'] as String?,
      harvestSeason: json['harvest_season'] as String?,
      harvestMethod: json['harvest_method'] as String?,
      leaf: json['leaf'] as bool?,
      edibleLeaf: json['edible_leaf'] as bool?,
      growthRate: json['growth_rate'] as String?,
      maintenance: json['maintenance'] as String?,
      medicinal: json['medicinal'] as bool?,
      poisonousToHumans: json['poisonous_to_humans'] as bool?,
      poisonousToPets: json['poisonous_to_pets'] as bool?,
      droughtTolerant: json['drought_tolerant'] as bool?,
      saltTolerant: json['salt_tolerant'] as bool?,
      thorny: json['thorny'] as bool?,
      invasive: json['invasive'] as bool?,
      rare: json['rare'] as bool?,
      tropical: json['tropical'] as bool?,
      cuisine: json['cuisine'] as bool?,
      indoor: json['indoor'] as bool?,
      careLevel: json['care_level'] as String?,
      description: json['description'] as String?,
      defaultImage: json['default_image'] == null
          ? null
          : ImageData.fromJson(json['default_image'] as Map<String, dynamic>),
      careGuides: json['care_guides'] as String?,
    );

Map<String, dynamic> _$PlantModelToJson(_PlantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'other_name': instance.otherName,
      'family': instance.family,
      'genus': instance.genus,
      'origin': instance.origin,
      'type': instance.type,
      'dimensions': instance.dimensions,
      'cycle': instance.cycle,
      'watering': instance.watering,
      'watering_general_benchmark': instance.wateringGeneralBenchmark,
      'plant_anatomy': instance.plantAnatomy,
      'sunlight': instance.sunlight,
      'pruning_month': instance.pruningMonth,
      'pruningCount': instance.pruningCount,
      'seeds': instance.seeds,
      'attracts': instance.attracts,
      'propagation': instance.propagation,
      'hardiness': instance.hardiness,
      'hardiness_location': instance.hardinessLocation,
      'flowers': instance.flowers,
      'flowering_season': instance.floweringSeason,
      'soil': instance.soil,
      'pest_susceptibility': instance.pestSusceptibility,
      'cones': instance.cones,
      'fruits': instance.fruits,
      'edible_fruit': instance.edibleFruit,
      'fruiting_season': instance.fruitingSeason,
      'harvest_season': instance.harvestSeason,
      'harvest_method': instance.harvestMethod,
      'leaf': instance.leaf,
      'edible_leaf': instance.edibleLeaf,
      'growth_rate': instance.growthRate,
      'maintenance': instance.maintenance,
      'medicinal': instance.medicinal,
      'poisonous_to_humans': instance.poisonousToHumans,
      'poisonous_to_pets': instance.poisonousToPets,
      'drought_tolerant': instance.droughtTolerant,
      'salt_tolerant': instance.saltTolerant,
      'thorny': instance.thorny,
      'invasive': instance.invasive,
      'rare': instance.rare,
      'tropical': instance.tropical,
      'cuisine': instance.cuisine,
      'indoor': instance.indoor,
      'care_level': instance.careLevel,
      'description': instance.description,
      'default_image': instance.defaultImage,
      'care_guides': instance.careGuides,
    };

_Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => _Dimensions(
      type: json['type'] as String?,
      minValue: (json['minValue'] as num?)?.toDouble(),
      maxValue: (json['maxValue'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$DimensionsToJson(_Dimensions instance) =>
    <String, dynamic>{
      'type': instance.type,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'unit': instance.unit,
    };

_WateringBenchmark _$WateringBenchmarkFromJson(Map<String, dynamic> json) =>
    _WateringBenchmark(
      value: json['value'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$WateringBenchmarkToJson(_WateringBenchmark instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
    };

_PlantAnatomy _$PlantAnatomyFromJson(Map<String, dynamic> json) =>
    _PlantAnatomy(
      part: json['part'] as String?,
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PlantAnatomyToJson(_PlantAnatomy instance) =>
    <String, dynamic>{
      'part': instance.part,
      'color': instance.color,
    };

_PruningCount _$PruningCountFromJson(Map<String, dynamic> json) =>
    _PruningCount(
      amount: (json['amount'] as num?)?.toInt(),
      interval: json['interval'] as String?,
    );

Map<String, dynamic> _$PruningCountToJson(_PruningCount instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'interval': instance.interval,
    };

_Hardiness _$HardinessFromJson(Map<String, dynamic> json) => _Hardiness(
      min: json['min'] as String?,
      max: json['max'] as String?,
    );

Map<String, dynamic> _$HardinessToJson(_Hardiness instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };

_HardinessLocation _$HardinessLocationFromJson(Map<String, dynamic> json) =>
    _HardinessLocation(
      fullUrl: json['fullUrl'] as String?,
      fullIframe: json['fullIframe'] as String?,
    );

Map<String, dynamic> _$HardinessLocationToJson(_HardinessLocation instance) =>
    <String, dynamic>{
      'fullUrl': instance.fullUrl,
      'fullIframe': instance.fullIframe,
    };

_ImageData _$ImageDataFromJson(Map<String, dynamic> json) => _ImageData(
      license: (json['license'] as num?)?.toInt(),
      licenseName: json['licenseName'] as String?,
      licenseUrl: json['licenseUrl'] as String?,
      originalUrl: json['originalUrl'] as String?,
      regularUrl: json['regularUrl'] as String?,
      mediumUrl: json['mediumUrl'] as String?,
      smallUrl: json['smallUrl'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ImageDataToJson(_ImageData instance) =>
    <String, dynamic>{
      'license': instance.license,
      'licenseName': instance.licenseName,
      'licenseUrl': instance.licenseUrl,
      'originalUrl': instance.originalUrl,
      'regularUrl': instance.regularUrl,
      'mediumUrl': instance.mediumUrl,
      'smallUrl': instance.smallUrl,
      'thumbnail': instance.thumbnail,
    };
