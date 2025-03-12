// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantModel {
  int? get id;
  @JsonKey(name: 'common_name')
  String? get commonName;
  @JsonKey(name: 'scientific_name')
  List<String>? get scientificName;
  @JsonKey(name: 'other_name')
  List<String>? get otherName;
  String? get family;
  String? get genus;
  List<String>? get origin;
  String? get type;
  List<Dimensions>? get dimensions;
  String? get cycle;
  String? get watering;
  @JsonKey(name: 'watering_general_benchmark')
  WateringBenchmark? get wateringGeneralBenchmark;
  @JsonKey(name: 'plant_anatomy')
  List<PlantAnatomy>? get plantAnatomy;
  List<String>? get sunlight;
  @JsonKey(name: 'pruning_month')
  List<String>? get pruningMonth;
  PruningCount? get pruningCount;
  bool? get seeds;
  List<String>? get attracts;
  List<String>? get propagation;
  Hardiness? get hardiness;
  @JsonKey(name: 'hardiness_location')
  HardinessLocation? get hardinessLocation;
  bool? get flowers;
  @JsonKey(name: 'flowering_season')
  String? get floweringSeason;
  List<String>? get soil;
  @JsonKey(name: 'pest_susceptibility')
  List<String>? get pestSusceptibility;
  bool? get cones;
  bool? get fruits;
  @JsonKey(name: 'edible_fruit')
  bool? get edibleFruit;
  @JsonKey(name: 'fruiting_season')
  String? get fruitingSeason;
  @JsonKey(name: 'harvest_season')
  String? get harvestSeason;
  @JsonKey(name: 'harvest_method')
  String? get harvestMethod;
  bool? get leaf;
  @JsonKey(name: 'edible_leaf')
  bool? get edibleLeaf;
  @JsonKey(name: 'growth_rate')
  String? get growthRate;
  String? get maintenance;
  bool? get medicinal;
  @JsonKey(name: 'poisonous_to_humans')
  bool? get poisonousToHumans;
  @JsonKey(name: 'poisonous_to_pets')
  bool? get poisonousToPets;
  @JsonKey(name: 'drought_tolerant')
  bool? get droughtTolerant;
  @JsonKey(name: 'salt_tolerant')
  bool? get saltTolerant;
  bool? get thorny;
  bool? get invasive;
  bool? get rare;
  bool? get tropical;
  bool? get cuisine;
  bool? get indoor;
  @JsonKey(name: 'care_level')
  String? get careLevel;
  String? get description;
  @JsonKey(name: 'default_image')
  ImageData? get defaultImage;
  @JsonKey(name: 'care_guides')
  String? get careGuides;

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantModelCopyWith<PlantModel> get copyWith =>
      _$PlantModelCopyWithImpl<PlantModel>(this as PlantModel, _$identity);

  /// Serializes this PlantModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commonName, commonName) ||
                other.commonName == commonName) &&
            const DeepCollectionEquality()
                .equals(other.scientificName, scientificName) &&
            const DeepCollectionEquality().equals(other.otherName, otherName) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.genus, genus) || other.genus == genus) &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.dimensions, dimensions) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.watering, watering) ||
                other.watering == watering) &&
            (identical(
                    other.wateringGeneralBenchmark, wateringGeneralBenchmark) ||
                other.wateringGeneralBenchmark == wateringGeneralBenchmark) &&
            const DeepCollectionEquality()
                .equals(other.plantAnatomy, plantAnatomy) &&
            const DeepCollectionEquality().equals(other.sunlight, sunlight) &&
            const DeepCollectionEquality()
                .equals(other.pruningMonth, pruningMonth) &&
            (identical(other.pruningCount, pruningCount) ||
                other.pruningCount == pruningCount) &&
            (identical(other.seeds, seeds) || other.seeds == seeds) &&
            const DeepCollectionEquality().equals(other.attracts, attracts) &&
            const DeepCollectionEquality()
                .equals(other.propagation, propagation) &&
            (identical(other.hardiness, hardiness) ||
                other.hardiness == hardiness) &&
            (identical(other.hardinessLocation, hardinessLocation) ||
                other.hardinessLocation == hardinessLocation) &&
            (identical(other.flowers, flowers) || other.flowers == flowers) &&
            (identical(other.floweringSeason, floweringSeason) ||
                other.floweringSeason == floweringSeason) &&
            const DeepCollectionEquality().equals(other.soil, soil) &&
            const DeepCollectionEquality()
                .equals(other.pestSusceptibility, pestSusceptibility) &&
            (identical(other.cones, cones) || other.cones == cones) &&
            (identical(other.fruits, fruits) || other.fruits == fruits) &&
            (identical(other.edibleFruit, edibleFruit) ||
                other.edibleFruit == edibleFruit) &&
            (identical(other.fruitingSeason, fruitingSeason) ||
                other.fruitingSeason == fruitingSeason) &&
            (identical(other.harvestSeason, harvestSeason) ||
                other.harvestSeason == harvestSeason) &&
            (identical(other.harvestMethod, harvestMethod) ||
                other.harvestMethod == harvestMethod) &&
            (identical(other.leaf, leaf) || other.leaf == leaf) &&
            (identical(other.edibleLeaf, edibleLeaf) ||
                other.edibleLeaf == edibleLeaf) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.medicinal, medicinal) ||
                other.medicinal == medicinal) &&
            (identical(other.poisonousToHumans, poisonousToHumans) ||
                other.poisonousToHumans == poisonousToHumans) &&
            (identical(other.poisonousToPets, poisonousToPets) ||
                other.poisonousToPets == poisonousToPets) &&
            (identical(other.droughtTolerant, droughtTolerant) ||
                other.droughtTolerant == droughtTolerant) &&
            (identical(other.saltTolerant, saltTolerant) ||
                other.saltTolerant == saltTolerant) &&
            (identical(other.thorny, thorny) || other.thorny == thorny) &&
            (identical(other.invasive, invasive) ||
                other.invasive == invasive) &&
            (identical(other.rare, rare) || other.rare == rare) &&
            (identical(other.tropical, tropical) ||
                other.tropical == tropical) &&
            (identical(other.cuisine, cuisine) || other.cuisine == cuisine) &&
            (identical(other.indoor, indoor) || other.indoor == indoor) &&
            (identical(other.careLevel, careLevel) ||
                other.careLevel == careLevel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.defaultImage, defaultImage) ||
                other.defaultImage == defaultImage) &&
            (identical(other.careGuides, careGuides) ||
                other.careGuides == careGuides));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        commonName,
        const DeepCollectionEquality().hash(scientificName),
        const DeepCollectionEquality().hash(otherName),
        family,
        genus,
        const DeepCollectionEquality().hash(origin),
        type,
        const DeepCollectionEquality().hash(dimensions),
        cycle,
        watering,
        wateringGeneralBenchmark,
        const DeepCollectionEquality().hash(plantAnatomy),
        const DeepCollectionEquality().hash(sunlight),
        const DeepCollectionEquality().hash(pruningMonth),
        pruningCount,
        seeds,
        const DeepCollectionEquality().hash(attracts),
        const DeepCollectionEquality().hash(propagation),
        hardiness,
        hardinessLocation,
        flowers,
        floweringSeason,
        const DeepCollectionEquality().hash(soil),
        const DeepCollectionEquality().hash(pestSusceptibility),
        cones,
        fruits,
        edibleFruit,
        fruitingSeason,
        harvestSeason,
        harvestMethod,
        leaf,
        edibleLeaf,
        growthRate,
        maintenance,
        medicinal,
        poisonousToHumans,
        poisonousToPets,
        droughtTolerant,
        saltTolerant,
        thorny,
        invasive,
        rare,
        tropical,
        cuisine,
        indoor,
        careLevel,
        description,
        defaultImage,
        careGuides
      ]);

  @override
  String toString() {
    return 'PlantModel(id: $id, commonName: $commonName, scientificName: $scientificName, otherName: $otherName, family: $family, genus: $genus, origin: $origin, type: $type, dimensions: $dimensions, cycle: $cycle, watering: $watering, wateringGeneralBenchmark: $wateringGeneralBenchmark, plantAnatomy: $plantAnatomy, sunlight: $sunlight, pruningMonth: $pruningMonth, pruningCount: $pruningCount, seeds: $seeds, attracts: $attracts, propagation: $propagation, hardiness: $hardiness, hardinessLocation: $hardinessLocation, flowers: $flowers, floweringSeason: $floweringSeason, soil: $soil, pestSusceptibility: $pestSusceptibility, cones: $cones, fruits: $fruits, edibleFruit: $edibleFruit, fruitingSeason: $fruitingSeason, harvestSeason: $harvestSeason, harvestMethod: $harvestMethod, leaf: $leaf, edibleLeaf: $edibleLeaf, growthRate: $growthRate, maintenance: $maintenance, medicinal: $medicinal, poisonousToHumans: $poisonousToHumans, poisonousToPets: $poisonousToPets, droughtTolerant: $droughtTolerant, saltTolerant: $saltTolerant, thorny: $thorny, invasive: $invasive, rare: $rare, tropical: $tropical, cuisine: $cuisine, indoor: $indoor, careLevel: $careLevel, description: $description, defaultImage: $defaultImage, careGuides: $careGuides)';
  }
}

/// @nodoc
abstract mixin class $PlantModelCopyWith<$Res> {
  factory $PlantModelCopyWith(
          PlantModel value, $Res Function(PlantModel) _then) =
      _$PlantModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'watering_general_benchmark')
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
      @JsonKey(name: 'care_guides') String? careGuides});

  $WateringBenchmarkCopyWith<$Res>? get wateringGeneralBenchmark;
  $PruningCountCopyWith<$Res>? get pruningCount;
  $HardinessCopyWith<$Res>? get hardiness;
  $HardinessLocationCopyWith<$Res>? get hardinessLocation;
  $ImageDataCopyWith<$Res>? get defaultImage;
}

/// @nodoc
class _$PlantModelCopyWithImpl<$Res> implements $PlantModelCopyWith<$Res> {
  _$PlantModelCopyWithImpl(this._self, this._then);

  final PlantModel _self;
  final $Res Function(PlantModel) _then;

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? commonName = freezed,
    Object? scientificName = freezed,
    Object? otherName = freezed,
    Object? family = freezed,
    Object? genus = freezed,
    Object? origin = freezed,
    Object? type = freezed,
    Object? dimensions = freezed,
    Object? cycle = freezed,
    Object? watering = freezed,
    Object? wateringGeneralBenchmark = freezed,
    Object? plantAnatomy = freezed,
    Object? sunlight = freezed,
    Object? pruningMonth = freezed,
    Object? pruningCount = freezed,
    Object? seeds = freezed,
    Object? attracts = freezed,
    Object? propagation = freezed,
    Object? hardiness = freezed,
    Object? hardinessLocation = freezed,
    Object? flowers = freezed,
    Object? floweringSeason = freezed,
    Object? soil = freezed,
    Object? pestSusceptibility = freezed,
    Object? cones = freezed,
    Object? fruits = freezed,
    Object? edibleFruit = freezed,
    Object? fruitingSeason = freezed,
    Object? harvestSeason = freezed,
    Object? harvestMethod = freezed,
    Object? leaf = freezed,
    Object? edibleLeaf = freezed,
    Object? growthRate = freezed,
    Object? maintenance = freezed,
    Object? medicinal = freezed,
    Object? poisonousToHumans = freezed,
    Object? poisonousToPets = freezed,
    Object? droughtTolerant = freezed,
    Object? saltTolerant = freezed,
    Object? thorny = freezed,
    Object? invasive = freezed,
    Object? rare = freezed,
    Object? tropical = freezed,
    Object? cuisine = freezed,
    Object? indoor = freezed,
    Object? careLevel = freezed,
    Object? description = freezed,
    Object? defaultImage = freezed,
    Object? careGuides = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      commonName: freezed == commonName
          ? _self.commonName
          : commonName // ignore: cast_nullable_to_non_nullable
              as String?,
      scientificName: freezed == scientificName
          ? _self.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      otherName: freezed == otherName
          ? _self.otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      genus: freezed == genus
          ? _self.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimensions: freezed == dimensions
          ? _self.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<Dimensions>?,
      cycle: freezed == cycle
          ? _self.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String?,
      watering: freezed == watering
          ? _self.watering
          : watering // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringGeneralBenchmark: freezed == wateringGeneralBenchmark
          ? _self.wateringGeneralBenchmark
          : wateringGeneralBenchmark // ignore: cast_nullable_to_non_nullable
              as WateringBenchmark?,
      plantAnatomy: freezed == plantAnatomy
          ? _self.plantAnatomy
          : plantAnatomy // ignore: cast_nullable_to_non_nullable
              as List<PlantAnatomy>?,
      sunlight: freezed == sunlight
          ? _self.sunlight
          : sunlight // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pruningMonth: freezed == pruningMonth
          ? _self.pruningMonth
          : pruningMonth // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pruningCount: freezed == pruningCount
          ? _self.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as PruningCount?,
      seeds: freezed == seeds
          ? _self.seeds
          : seeds // ignore: cast_nullable_to_non_nullable
              as bool?,
      attracts: freezed == attracts
          ? _self.attracts
          : attracts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      propagation: freezed == propagation
          ? _self.propagation
          : propagation // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hardiness: freezed == hardiness
          ? _self.hardiness
          : hardiness // ignore: cast_nullable_to_non_nullable
              as Hardiness?,
      hardinessLocation: freezed == hardinessLocation
          ? _self.hardinessLocation
          : hardinessLocation // ignore: cast_nullable_to_non_nullable
              as HardinessLocation?,
      flowers: freezed == flowers
          ? _self.flowers
          : flowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      floweringSeason: freezed == floweringSeason
          ? _self.floweringSeason
          : floweringSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      soil: freezed == soil
          ? _self.soil
          : soil // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pestSusceptibility: freezed == pestSusceptibility
          ? _self.pestSusceptibility
          : pestSusceptibility // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cones: freezed == cones
          ? _self.cones
          : cones // ignore: cast_nullable_to_non_nullable
              as bool?,
      fruits: freezed == fruits
          ? _self.fruits
          : fruits // ignore: cast_nullable_to_non_nullable
              as bool?,
      edibleFruit: freezed == edibleFruit
          ? _self.edibleFruit
          : edibleFruit // ignore: cast_nullable_to_non_nullable
              as bool?,
      fruitingSeason: freezed == fruitingSeason
          ? _self.fruitingSeason
          : fruitingSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      harvestSeason: freezed == harvestSeason
          ? _self.harvestSeason
          : harvestSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      harvestMethod: freezed == harvestMethod
          ? _self.harvestMethod
          : harvestMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      leaf: freezed == leaf
          ? _self.leaf
          : leaf // ignore: cast_nullable_to_non_nullable
              as bool?,
      edibleLeaf: freezed == edibleLeaf
          ? _self.edibleLeaf
          : edibleLeaf // ignore: cast_nullable_to_non_nullable
              as bool?,
      growthRate: freezed == growthRate
          ? _self.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as String?,
      maintenance: freezed == maintenance
          ? _self.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as String?,
      medicinal: freezed == medicinal
          ? _self.medicinal
          : medicinal // ignore: cast_nullable_to_non_nullable
              as bool?,
      poisonousToHumans: freezed == poisonousToHumans
          ? _self.poisonousToHumans
          : poisonousToHumans // ignore: cast_nullable_to_non_nullable
              as bool?,
      poisonousToPets: freezed == poisonousToPets
          ? _self.poisonousToPets
          : poisonousToPets // ignore: cast_nullable_to_non_nullable
              as bool?,
      droughtTolerant: freezed == droughtTolerant
          ? _self.droughtTolerant
          : droughtTolerant // ignore: cast_nullable_to_non_nullable
              as bool?,
      saltTolerant: freezed == saltTolerant
          ? _self.saltTolerant
          : saltTolerant // ignore: cast_nullable_to_non_nullable
              as bool?,
      thorny: freezed == thorny
          ? _self.thorny
          : thorny // ignore: cast_nullable_to_non_nullable
              as bool?,
      invasive: freezed == invasive
          ? _self.invasive
          : invasive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rare: freezed == rare
          ? _self.rare
          : rare // ignore: cast_nullable_to_non_nullable
              as bool?,
      tropical: freezed == tropical
          ? _self.tropical
          : tropical // ignore: cast_nullable_to_non_nullable
              as bool?,
      cuisine: freezed == cuisine
          ? _self.cuisine
          : cuisine // ignore: cast_nullable_to_non_nullable
              as bool?,
      indoor: freezed == indoor
          ? _self.indoor
          : indoor // ignore: cast_nullable_to_non_nullable
              as bool?,
      careLevel: freezed == careLevel
          ? _self.careLevel
          : careLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultImage: freezed == defaultImage
          ? _self.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as ImageData?,
      careGuides: freezed == careGuides
          ? _self.careGuides
          : careGuides // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WateringBenchmarkCopyWith<$Res>? get wateringGeneralBenchmark {
    if (_self.wateringGeneralBenchmark == null) {
      return null;
    }

    return $WateringBenchmarkCopyWith<$Res>(_self.wateringGeneralBenchmark!,
        (value) {
      return _then(_self.copyWith(wateringGeneralBenchmark: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PruningCountCopyWith<$Res>? get pruningCount {
    if (_self.pruningCount == null) {
      return null;
    }

    return $PruningCountCopyWith<$Res>(_self.pruningCount!, (value) {
      return _then(_self.copyWith(pruningCount: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HardinessCopyWith<$Res>? get hardiness {
    if (_self.hardiness == null) {
      return null;
    }

    return $HardinessCopyWith<$Res>(_self.hardiness!, (value) {
      return _then(_self.copyWith(hardiness: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HardinessLocationCopyWith<$Res>? get hardinessLocation {
    if (_self.hardinessLocation == null) {
      return null;
    }

    return $HardinessLocationCopyWith<$Res>(_self.hardinessLocation!, (value) {
      return _then(_self.copyWith(hardinessLocation: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res>? get defaultImage {
    if (_self.defaultImage == null) {
      return null;
    }

    return $ImageDataCopyWith<$Res>(_self.defaultImage!, (value) {
      return _then(_self.copyWith(defaultImage: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PlantModel implements PlantModel {
  const _PlantModel(
      {this.id,
      @JsonKey(name: 'common_name') this.commonName,
      @JsonKey(name: 'scientific_name') final List<String>? scientificName,
      @JsonKey(name: 'other_name') final List<String>? otherName,
      this.family,
      this.genus,
      final List<String>? origin,
      this.type,
      final List<Dimensions>? dimensions,
      this.cycle,
      this.watering,
      @JsonKey(name: 'watering_general_benchmark')
      this.wateringGeneralBenchmark,
      @JsonKey(name: 'plant_anatomy') final List<PlantAnatomy>? plantAnatomy,
      final List<String>? sunlight,
      @JsonKey(name: 'pruning_month') final List<String>? pruningMonth,
      this.pruningCount,
      this.seeds,
      final List<String>? attracts,
      final List<String>? propagation,
      this.hardiness,
      @JsonKey(name: 'hardiness_location') this.hardinessLocation,
      this.flowers,
      @JsonKey(name: 'flowering_season') this.floweringSeason,
      final List<String>? soil,
      @JsonKey(name: 'pest_susceptibility')
      final List<String>? pestSusceptibility,
      this.cones,
      this.fruits,
      @JsonKey(name: 'edible_fruit') this.edibleFruit,
      @JsonKey(name: 'fruiting_season') this.fruitingSeason,
      @JsonKey(name: 'harvest_season') this.harvestSeason,
      @JsonKey(name: 'harvest_method') this.harvestMethod,
      this.leaf,
      @JsonKey(name: 'edible_leaf') this.edibleLeaf,
      @JsonKey(name: 'growth_rate') this.growthRate,
      this.maintenance,
      this.medicinal,
      @JsonKey(name: 'poisonous_to_humans') this.poisonousToHumans,
      @JsonKey(name: 'poisonous_to_pets') this.poisonousToPets,
      @JsonKey(name: 'drought_tolerant') this.droughtTolerant,
      @JsonKey(name: 'salt_tolerant') this.saltTolerant,
      this.thorny,
      this.invasive,
      this.rare,
      this.tropical,
      this.cuisine,
      this.indoor,
      @JsonKey(name: 'care_level') this.careLevel,
      this.description,
      @JsonKey(name: 'default_image') this.defaultImage,
      @JsonKey(name: 'care_guides') this.careGuides})
      : _scientificName = scientificName,
        _otherName = otherName,
        _origin = origin,
        _dimensions = dimensions,
        _plantAnatomy = plantAnatomy,
        _sunlight = sunlight,
        _pruningMonth = pruningMonth,
        _attracts = attracts,
        _propagation = propagation,
        _soil = soil,
        _pestSusceptibility = pestSusceptibility;
  factory _PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'common_name')
  final String? commonName;
  final List<String>? _scientificName;
  @override
  @JsonKey(name: 'scientific_name')
  List<String>? get scientificName {
    final value = _scientificName;
    if (value == null) return null;
    if (_scientificName is EqualUnmodifiableListView) return _scientificName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _otherName;
  @override
  @JsonKey(name: 'other_name')
  List<String>? get otherName {
    final value = _otherName;
    if (value == null) return null;
    if (_otherName is EqualUnmodifiableListView) return _otherName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? family;
  @override
  final String? genus;
  final List<String>? _origin;
  @override
  List<String>? get origin {
    final value = _origin;
    if (value == null) return null;
    if (_origin is EqualUnmodifiableListView) return _origin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? type;
  final List<Dimensions>? _dimensions;
  @override
  List<Dimensions>? get dimensions {
    final value = _dimensions;
    if (value == null) return null;
    if (_dimensions is EqualUnmodifiableListView) return _dimensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? cycle;
  @override
  final String? watering;
  @override
  @JsonKey(name: 'watering_general_benchmark')
  final WateringBenchmark? wateringGeneralBenchmark;
  final List<PlantAnatomy>? _plantAnatomy;
  @override
  @JsonKey(name: 'plant_anatomy')
  List<PlantAnatomy>? get plantAnatomy {
    final value = _plantAnatomy;
    if (value == null) return null;
    if (_plantAnatomy is EqualUnmodifiableListView) return _plantAnatomy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sunlight;
  @override
  List<String>? get sunlight {
    final value = _sunlight;
    if (value == null) return null;
    if (_sunlight is EqualUnmodifiableListView) return _sunlight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _pruningMonth;
  @override
  @JsonKey(name: 'pruning_month')
  List<String>? get pruningMonth {
    final value = _pruningMonth;
    if (value == null) return null;
    if (_pruningMonth is EqualUnmodifiableListView) return _pruningMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PruningCount? pruningCount;
  @override
  final bool? seeds;
  final List<String>? _attracts;
  @override
  List<String>? get attracts {
    final value = _attracts;
    if (value == null) return null;
    if (_attracts is EqualUnmodifiableListView) return _attracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _propagation;
  @override
  List<String>? get propagation {
    final value = _propagation;
    if (value == null) return null;
    if (_propagation is EqualUnmodifiableListView) return _propagation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Hardiness? hardiness;
  @override
  @JsonKey(name: 'hardiness_location')
  final HardinessLocation? hardinessLocation;
  @override
  final bool? flowers;
  @override
  @JsonKey(name: 'flowering_season')
  final String? floweringSeason;
  final List<String>? _soil;
  @override
  List<String>? get soil {
    final value = _soil;
    if (value == null) return null;
    if (_soil is EqualUnmodifiableListView) return _soil;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _pestSusceptibility;
  @override
  @JsonKey(name: 'pest_susceptibility')
  List<String>? get pestSusceptibility {
    final value = _pestSusceptibility;
    if (value == null) return null;
    if (_pestSusceptibility is EqualUnmodifiableListView)
      return _pestSusceptibility;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? cones;
  @override
  final bool? fruits;
  @override
  @JsonKey(name: 'edible_fruit')
  final bool? edibleFruit;
  @override
  @JsonKey(name: 'fruiting_season')
  final String? fruitingSeason;
  @override
  @JsonKey(name: 'harvest_season')
  final String? harvestSeason;
  @override
  @JsonKey(name: 'harvest_method')
  final String? harvestMethod;
  @override
  final bool? leaf;
  @override
  @JsonKey(name: 'edible_leaf')
  final bool? edibleLeaf;
  @override
  @JsonKey(name: 'growth_rate')
  final String? growthRate;
  @override
  final String? maintenance;
  @override
  final bool? medicinal;
  @override
  @JsonKey(name: 'poisonous_to_humans')
  final bool? poisonousToHumans;
  @override
  @JsonKey(name: 'poisonous_to_pets')
  final bool? poisonousToPets;
  @override
  @JsonKey(name: 'drought_tolerant')
  final bool? droughtTolerant;
  @override
  @JsonKey(name: 'salt_tolerant')
  final bool? saltTolerant;
  @override
  final bool? thorny;
  @override
  final bool? invasive;
  @override
  final bool? rare;
  @override
  final bool? tropical;
  @override
  final bool? cuisine;
  @override
  final bool? indoor;
  @override
  @JsonKey(name: 'care_level')
  final String? careLevel;
  @override
  final String? description;
  @override
  @JsonKey(name: 'default_image')
  final ImageData? defaultImage;
  @override
  @JsonKey(name: 'care_guides')
  final String? careGuides;

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantModelCopyWith<_PlantModel> get copyWith =>
      __$PlantModelCopyWithImpl<_PlantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commonName, commonName) ||
                other.commonName == commonName) &&
            const DeepCollectionEquality()
                .equals(other._scientificName, _scientificName) &&
            const DeepCollectionEquality()
                .equals(other._otherName, _otherName) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.genus, genus) || other.genus == genus) &&
            const DeepCollectionEquality().equals(other._origin, _origin) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._dimensions, _dimensions) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.watering, watering) ||
                other.watering == watering) &&
            (identical(
                    other.wateringGeneralBenchmark, wateringGeneralBenchmark) ||
                other.wateringGeneralBenchmark == wateringGeneralBenchmark) &&
            const DeepCollectionEquality()
                .equals(other._plantAnatomy, _plantAnatomy) &&
            const DeepCollectionEquality().equals(other._sunlight, _sunlight) &&
            const DeepCollectionEquality()
                .equals(other._pruningMonth, _pruningMonth) &&
            (identical(other.pruningCount, pruningCount) ||
                other.pruningCount == pruningCount) &&
            (identical(other.seeds, seeds) || other.seeds == seeds) &&
            const DeepCollectionEquality().equals(other._attracts, _attracts) &&
            const DeepCollectionEquality()
                .equals(other._propagation, _propagation) &&
            (identical(other.hardiness, hardiness) ||
                other.hardiness == hardiness) &&
            (identical(other.hardinessLocation, hardinessLocation) ||
                other.hardinessLocation == hardinessLocation) &&
            (identical(other.flowers, flowers) || other.flowers == flowers) &&
            (identical(other.floweringSeason, floweringSeason) ||
                other.floweringSeason == floweringSeason) &&
            const DeepCollectionEquality().equals(other._soil, _soil) &&
            const DeepCollectionEquality()
                .equals(other._pestSusceptibility, _pestSusceptibility) &&
            (identical(other.cones, cones) || other.cones == cones) &&
            (identical(other.fruits, fruits) || other.fruits == fruits) &&
            (identical(other.edibleFruit, edibleFruit) ||
                other.edibleFruit == edibleFruit) &&
            (identical(other.fruitingSeason, fruitingSeason) ||
                other.fruitingSeason == fruitingSeason) &&
            (identical(other.harvestSeason, harvestSeason) ||
                other.harvestSeason == harvestSeason) &&
            (identical(other.harvestMethod, harvestMethod) ||
                other.harvestMethod == harvestMethod) &&
            (identical(other.leaf, leaf) || other.leaf == leaf) &&
            (identical(other.edibleLeaf, edibleLeaf) ||
                other.edibleLeaf == edibleLeaf) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate) &&
            (identical(other.maintenance, maintenance) ||
                other.maintenance == maintenance) &&
            (identical(other.medicinal, medicinal) ||
                other.medicinal == medicinal) &&
            (identical(other.poisonousToHumans, poisonousToHumans) ||
                other.poisonousToHumans == poisonousToHumans) &&
            (identical(other.poisonousToPets, poisonousToPets) ||
                other.poisonousToPets == poisonousToPets) &&
            (identical(other.droughtTolerant, droughtTolerant) ||
                other.droughtTolerant == droughtTolerant) &&
            (identical(other.saltTolerant, saltTolerant) ||
                other.saltTolerant == saltTolerant) &&
            (identical(other.thorny, thorny) || other.thorny == thorny) &&
            (identical(other.invasive, invasive) ||
                other.invasive == invasive) &&
            (identical(other.rare, rare) || other.rare == rare) &&
            (identical(other.tropical, tropical) ||
                other.tropical == tropical) &&
            (identical(other.cuisine, cuisine) || other.cuisine == cuisine) &&
            (identical(other.indoor, indoor) || other.indoor == indoor) &&
            (identical(other.careLevel, careLevel) ||
                other.careLevel == careLevel) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.defaultImage, defaultImage) ||
                other.defaultImage == defaultImage) &&
            (identical(other.careGuides, careGuides) ||
                other.careGuides == careGuides));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        commonName,
        const DeepCollectionEquality().hash(_scientificName),
        const DeepCollectionEquality().hash(_otherName),
        family,
        genus,
        const DeepCollectionEquality().hash(_origin),
        type,
        const DeepCollectionEquality().hash(_dimensions),
        cycle,
        watering,
        wateringGeneralBenchmark,
        const DeepCollectionEquality().hash(_plantAnatomy),
        const DeepCollectionEquality().hash(_sunlight),
        const DeepCollectionEquality().hash(_pruningMonth),
        pruningCount,
        seeds,
        const DeepCollectionEquality().hash(_attracts),
        const DeepCollectionEquality().hash(_propagation),
        hardiness,
        hardinessLocation,
        flowers,
        floweringSeason,
        const DeepCollectionEquality().hash(_soil),
        const DeepCollectionEquality().hash(_pestSusceptibility),
        cones,
        fruits,
        edibleFruit,
        fruitingSeason,
        harvestSeason,
        harvestMethod,
        leaf,
        edibleLeaf,
        growthRate,
        maintenance,
        medicinal,
        poisonousToHumans,
        poisonousToPets,
        droughtTolerant,
        saltTolerant,
        thorny,
        invasive,
        rare,
        tropical,
        cuisine,
        indoor,
        careLevel,
        description,
        defaultImage,
        careGuides
      ]);

  @override
  String toString() {
    return 'PlantModel(id: $id, commonName: $commonName, scientificName: $scientificName, otherName: $otherName, family: $family, genus: $genus, origin: $origin, type: $type, dimensions: $dimensions, cycle: $cycle, watering: $watering, wateringGeneralBenchmark: $wateringGeneralBenchmark, plantAnatomy: $plantAnatomy, sunlight: $sunlight, pruningMonth: $pruningMonth, pruningCount: $pruningCount, seeds: $seeds, attracts: $attracts, propagation: $propagation, hardiness: $hardiness, hardinessLocation: $hardinessLocation, flowers: $flowers, floweringSeason: $floweringSeason, soil: $soil, pestSusceptibility: $pestSusceptibility, cones: $cones, fruits: $fruits, edibleFruit: $edibleFruit, fruitingSeason: $fruitingSeason, harvestSeason: $harvestSeason, harvestMethod: $harvestMethod, leaf: $leaf, edibleLeaf: $edibleLeaf, growthRate: $growthRate, maintenance: $maintenance, medicinal: $medicinal, poisonousToHumans: $poisonousToHumans, poisonousToPets: $poisonousToPets, droughtTolerant: $droughtTolerant, saltTolerant: $saltTolerant, thorny: $thorny, invasive: $invasive, rare: $rare, tropical: $tropical, cuisine: $cuisine, indoor: $indoor, careLevel: $careLevel, description: $description, defaultImage: $defaultImage, careGuides: $careGuides)';
  }
}

/// @nodoc
abstract mixin class _$PlantModelCopyWith<$Res>
    implements $PlantModelCopyWith<$Res> {
  factory _$PlantModelCopyWith(
          _PlantModel value, $Res Function(_PlantModel) _then) =
      __$PlantModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'watering_general_benchmark')
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
      @JsonKey(name: 'care_guides') String? careGuides});

  @override
  $WateringBenchmarkCopyWith<$Res>? get wateringGeneralBenchmark;
  @override
  $PruningCountCopyWith<$Res>? get pruningCount;
  @override
  $HardinessCopyWith<$Res>? get hardiness;
  @override
  $HardinessLocationCopyWith<$Res>? get hardinessLocation;
  @override
  $ImageDataCopyWith<$Res>? get defaultImage;
}

/// @nodoc
class __$PlantModelCopyWithImpl<$Res> implements _$PlantModelCopyWith<$Res> {
  __$PlantModelCopyWithImpl(this._self, this._then);

  final _PlantModel _self;
  final $Res Function(_PlantModel) _then;

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? commonName = freezed,
    Object? scientificName = freezed,
    Object? otherName = freezed,
    Object? family = freezed,
    Object? genus = freezed,
    Object? origin = freezed,
    Object? type = freezed,
    Object? dimensions = freezed,
    Object? cycle = freezed,
    Object? watering = freezed,
    Object? wateringGeneralBenchmark = freezed,
    Object? plantAnatomy = freezed,
    Object? sunlight = freezed,
    Object? pruningMonth = freezed,
    Object? pruningCount = freezed,
    Object? seeds = freezed,
    Object? attracts = freezed,
    Object? propagation = freezed,
    Object? hardiness = freezed,
    Object? hardinessLocation = freezed,
    Object? flowers = freezed,
    Object? floweringSeason = freezed,
    Object? soil = freezed,
    Object? pestSusceptibility = freezed,
    Object? cones = freezed,
    Object? fruits = freezed,
    Object? edibleFruit = freezed,
    Object? fruitingSeason = freezed,
    Object? harvestSeason = freezed,
    Object? harvestMethod = freezed,
    Object? leaf = freezed,
    Object? edibleLeaf = freezed,
    Object? growthRate = freezed,
    Object? maintenance = freezed,
    Object? medicinal = freezed,
    Object? poisonousToHumans = freezed,
    Object? poisonousToPets = freezed,
    Object? droughtTolerant = freezed,
    Object? saltTolerant = freezed,
    Object? thorny = freezed,
    Object? invasive = freezed,
    Object? rare = freezed,
    Object? tropical = freezed,
    Object? cuisine = freezed,
    Object? indoor = freezed,
    Object? careLevel = freezed,
    Object? description = freezed,
    Object? defaultImage = freezed,
    Object? careGuides = freezed,
  }) {
    return _then(_PlantModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      commonName: freezed == commonName
          ? _self.commonName
          : commonName // ignore: cast_nullable_to_non_nullable
              as String?,
      scientificName: freezed == scientificName
          ? _self._scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      otherName: freezed == otherName
          ? _self._otherName
          : otherName // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      genus: freezed == genus
          ? _self.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _self._origin
          : origin // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      dimensions: freezed == dimensions
          ? _self._dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as List<Dimensions>?,
      cycle: freezed == cycle
          ? _self.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String?,
      watering: freezed == watering
          ? _self.watering
          : watering // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringGeneralBenchmark: freezed == wateringGeneralBenchmark
          ? _self.wateringGeneralBenchmark
          : wateringGeneralBenchmark // ignore: cast_nullable_to_non_nullable
              as WateringBenchmark?,
      plantAnatomy: freezed == plantAnatomy
          ? _self._plantAnatomy
          : plantAnatomy // ignore: cast_nullable_to_non_nullable
              as List<PlantAnatomy>?,
      sunlight: freezed == sunlight
          ? _self._sunlight
          : sunlight // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pruningMonth: freezed == pruningMonth
          ? _self._pruningMonth
          : pruningMonth // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pruningCount: freezed == pruningCount
          ? _self.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as PruningCount?,
      seeds: freezed == seeds
          ? _self.seeds
          : seeds // ignore: cast_nullable_to_non_nullable
              as bool?,
      attracts: freezed == attracts
          ? _self._attracts
          : attracts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      propagation: freezed == propagation
          ? _self._propagation
          : propagation // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      hardiness: freezed == hardiness
          ? _self.hardiness
          : hardiness // ignore: cast_nullable_to_non_nullable
              as Hardiness?,
      hardinessLocation: freezed == hardinessLocation
          ? _self.hardinessLocation
          : hardinessLocation // ignore: cast_nullable_to_non_nullable
              as HardinessLocation?,
      flowers: freezed == flowers
          ? _self.flowers
          : flowers // ignore: cast_nullable_to_non_nullable
              as bool?,
      floweringSeason: freezed == floweringSeason
          ? _self.floweringSeason
          : floweringSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      soil: freezed == soil
          ? _self._soil
          : soil // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pestSusceptibility: freezed == pestSusceptibility
          ? _self._pestSusceptibility
          : pestSusceptibility // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      cones: freezed == cones
          ? _self.cones
          : cones // ignore: cast_nullable_to_non_nullable
              as bool?,
      fruits: freezed == fruits
          ? _self.fruits
          : fruits // ignore: cast_nullable_to_non_nullable
              as bool?,
      edibleFruit: freezed == edibleFruit
          ? _self.edibleFruit
          : edibleFruit // ignore: cast_nullable_to_non_nullable
              as bool?,
      fruitingSeason: freezed == fruitingSeason
          ? _self.fruitingSeason
          : fruitingSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      harvestSeason: freezed == harvestSeason
          ? _self.harvestSeason
          : harvestSeason // ignore: cast_nullable_to_non_nullable
              as String?,
      harvestMethod: freezed == harvestMethod
          ? _self.harvestMethod
          : harvestMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      leaf: freezed == leaf
          ? _self.leaf
          : leaf // ignore: cast_nullable_to_non_nullable
              as bool?,
      edibleLeaf: freezed == edibleLeaf
          ? _self.edibleLeaf
          : edibleLeaf // ignore: cast_nullable_to_non_nullable
              as bool?,
      growthRate: freezed == growthRate
          ? _self.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as String?,
      maintenance: freezed == maintenance
          ? _self.maintenance
          : maintenance // ignore: cast_nullable_to_non_nullable
              as String?,
      medicinal: freezed == medicinal
          ? _self.medicinal
          : medicinal // ignore: cast_nullable_to_non_nullable
              as bool?,
      poisonousToHumans: freezed == poisonousToHumans
          ? _self.poisonousToHumans
          : poisonousToHumans // ignore: cast_nullable_to_non_nullable
              as bool?,
      poisonousToPets: freezed == poisonousToPets
          ? _self.poisonousToPets
          : poisonousToPets // ignore: cast_nullable_to_non_nullable
              as bool?,
      droughtTolerant: freezed == droughtTolerant
          ? _self.droughtTolerant
          : droughtTolerant // ignore: cast_nullable_to_non_nullable
              as bool?,
      saltTolerant: freezed == saltTolerant
          ? _self.saltTolerant
          : saltTolerant // ignore: cast_nullable_to_non_nullable
              as bool?,
      thorny: freezed == thorny
          ? _self.thorny
          : thorny // ignore: cast_nullable_to_non_nullable
              as bool?,
      invasive: freezed == invasive
          ? _self.invasive
          : invasive // ignore: cast_nullable_to_non_nullable
              as bool?,
      rare: freezed == rare
          ? _self.rare
          : rare // ignore: cast_nullable_to_non_nullable
              as bool?,
      tropical: freezed == tropical
          ? _self.tropical
          : tropical // ignore: cast_nullable_to_non_nullable
              as bool?,
      cuisine: freezed == cuisine
          ? _self.cuisine
          : cuisine // ignore: cast_nullable_to_non_nullable
              as bool?,
      indoor: freezed == indoor
          ? _self.indoor
          : indoor // ignore: cast_nullable_to_non_nullable
              as bool?,
      careLevel: freezed == careLevel
          ? _self.careLevel
          : careLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultImage: freezed == defaultImage
          ? _self.defaultImage
          : defaultImage // ignore: cast_nullable_to_non_nullable
              as ImageData?,
      careGuides: freezed == careGuides
          ? _self.careGuides
          : careGuides // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WateringBenchmarkCopyWith<$Res>? get wateringGeneralBenchmark {
    if (_self.wateringGeneralBenchmark == null) {
      return null;
    }

    return $WateringBenchmarkCopyWith<$Res>(_self.wateringGeneralBenchmark!,
        (value) {
      return _then(_self.copyWith(wateringGeneralBenchmark: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PruningCountCopyWith<$Res>? get pruningCount {
    if (_self.pruningCount == null) {
      return null;
    }

    return $PruningCountCopyWith<$Res>(_self.pruningCount!, (value) {
      return _then(_self.copyWith(pruningCount: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HardinessCopyWith<$Res>? get hardiness {
    if (_self.hardiness == null) {
      return null;
    }

    return $HardinessCopyWith<$Res>(_self.hardiness!, (value) {
      return _then(_self.copyWith(hardiness: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HardinessLocationCopyWith<$Res>? get hardinessLocation {
    if (_self.hardinessLocation == null) {
      return null;
    }

    return $HardinessLocationCopyWith<$Res>(_self.hardinessLocation!, (value) {
      return _then(_self.copyWith(hardinessLocation: value));
    });
  }

  /// Create a copy of PlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<$Res>? get defaultImage {
    if (_self.defaultImage == null) {
      return null;
    }

    return $ImageDataCopyWith<$Res>(_self.defaultImage!, (value) {
      return _then(_self.copyWith(defaultImage: value));
    });
  }
}

/// @nodoc
mixin _$Dimensions {
  String? get type;
  double? get minValue;
  double? get maxValue;
  String? get unit;

  /// Create a copy of Dimensions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DimensionsCopyWith<Dimensions> get copyWith =>
      _$DimensionsCopyWithImpl<Dimensions>(this as Dimensions, _$identity);

  /// Serializes this Dimensions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dimensions &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, minValue, maxValue, unit);

  @override
  String toString() {
    return 'Dimensions(type: $type, minValue: $minValue, maxValue: $maxValue, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $DimensionsCopyWith<$Res> {
  factory $DimensionsCopyWith(
          Dimensions value, $Res Function(Dimensions) _then) =
      _$DimensionsCopyWithImpl;
  @useResult
  $Res call({String? type, double? minValue, double? maxValue, String? unit});
}

/// @nodoc
class _$DimensionsCopyWithImpl<$Res> implements $DimensionsCopyWith<$Res> {
  _$DimensionsCopyWithImpl(this._self, this._then);

  final Dimensions _self;
  final $Res Function(Dimensions) _then;

  /// Create a copy of Dimensions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? unit = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      minValue: freezed == minValue
          ? _self.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxValue: freezed == maxValue
          ? _self.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Dimensions implements Dimensions {
  const _Dimensions({this.type, this.minValue, this.maxValue, this.unit});
  factory _Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);

  @override
  final String? type;
  @override
  final double? minValue;
  @override
  final double? maxValue;
  @override
  final String? unit;

  /// Create a copy of Dimensions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DimensionsCopyWith<_Dimensions> get copyWith =>
      __$DimensionsCopyWithImpl<_Dimensions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DimensionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dimensions &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, minValue, maxValue, unit);

  @override
  String toString() {
    return 'Dimensions(type: $type, minValue: $minValue, maxValue: $maxValue, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$DimensionsCopyWith<$Res>
    implements $DimensionsCopyWith<$Res> {
  factory _$DimensionsCopyWith(
          _Dimensions value, $Res Function(_Dimensions) _then) =
      __$DimensionsCopyWithImpl;
  @override
  @useResult
  $Res call({String? type, double? minValue, double? maxValue, String? unit});
}

/// @nodoc
class __$DimensionsCopyWithImpl<$Res> implements _$DimensionsCopyWith<$Res> {
  __$DimensionsCopyWithImpl(this._self, this._then);

  final _Dimensions _self;
  final $Res Function(_Dimensions) _then;

  /// Create a copy of Dimensions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? unit = freezed,
  }) {
    return _then(_Dimensions(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      minValue: freezed == minValue
          ? _self.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as double?,
      maxValue: freezed == maxValue
          ? _self.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$WateringBenchmark {
  String? get value;
  String? get unit;

  /// Create a copy of WateringBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WateringBenchmarkCopyWith<WateringBenchmark> get copyWith =>
      _$WateringBenchmarkCopyWithImpl<WateringBenchmark>(
          this as WateringBenchmark, _$identity);

  /// Serializes this WateringBenchmark to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WateringBenchmark &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @override
  String toString() {
    return 'WateringBenchmark(value: $value, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $WateringBenchmarkCopyWith<$Res> {
  factory $WateringBenchmarkCopyWith(
          WateringBenchmark value, $Res Function(WateringBenchmark) _then) =
      _$WateringBenchmarkCopyWithImpl;
  @useResult
  $Res call({String? value, String? unit});
}

/// @nodoc
class _$WateringBenchmarkCopyWithImpl<$Res>
    implements $WateringBenchmarkCopyWith<$Res> {
  _$WateringBenchmarkCopyWithImpl(this._self, this._then);

  final WateringBenchmark _self;
  final $Res Function(WateringBenchmark) _then;

  /// Create a copy of WateringBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_self.copyWith(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WateringBenchmark implements WateringBenchmark {
  const _WateringBenchmark({this.value, this.unit});
  factory _WateringBenchmark.fromJson(Map<String, dynamic> json) =>
      _$WateringBenchmarkFromJson(json);

  @override
  final String? value;
  @override
  final String? unit;

  /// Create a copy of WateringBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WateringBenchmarkCopyWith<_WateringBenchmark> get copyWith =>
      __$WateringBenchmarkCopyWithImpl<_WateringBenchmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WateringBenchmarkToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WateringBenchmark &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @override
  String toString() {
    return 'WateringBenchmark(value: $value, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$WateringBenchmarkCopyWith<$Res>
    implements $WateringBenchmarkCopyWith<$Res> {
  factory _$WateringBenchmarkCopyWith(
          _WateringBenchmark value, $Res Function(_WateringBenchmark) _then) =
      __$WateringBenchmarkCopyWithImpl;
  @override
  @useResult
  $Res call({String? value, String? unit});
}

/// @nodoc
class __$WateringBenchmarkCopyWithImpl<$Res>
    implements _$WateringBenchmarkCopyWith<$Res> {
  __$WateringBenchmarkCopyWithImpl(this._self, this._then);

  final _WateringBenchmark _self;
  final $Res Function(_WateringBenchmark) _then;

  /// Create a copy of WateringBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_WateringBenchmark(
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$PlantAnatomy {
  String? get part;
  List<String>? get color;

  /// Create a copy of PlantAnatomy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantAnatomyCopyWith<PlantAnatomy> get copyWith =>
      _$PlantAnatomyCopyWithImpl<PlantAnatomy>(
          this as PlantAnatomy, _$identity);

  /// Serializes this PlantAnatomy to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantAnatomy &&
            (identical(other.part, part) || other.part == part) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, part, const DeepCollectionEquality().hash(color));

  @override
  String toString() {
    return 'PlantAnatomy(part: $part, color: $color)';
  }
}

/// @nodoc
abstract mixin class $PlantAnatomyCopyWith<$Res> {
  factory $PlantAnatomyCopyWith(
          PlantAnatomy value, $Res Function(PlantAnatomy) _then) =
      _$PlantAnatomyCopyWithImpl;
  @useResult
  $Res call({String? part, List<String>? color});
}

/// @nodoc
class _$PlantAnatomyCopyWithImpl<$Res> implements $PlantAnatomyCopyWith<$Res> {
  _$PlantAnatomyCopyWithImpl(this._self, this._then);

  final PlantAnatomy _self;
  final $Res Function(PlantAnatomy) _then;

  /// Create a copy of PlantAnatomy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? part = freezed,
    Object? color = freezed,
  }) {
    return _then(_self.copyWith(
      part: freezed == part
          ? _self.part
          : part // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlantAnatomy implements PlantAnatomy {
  const _PlantAnatomy({this.part, final List<String>? color}) : _color = color;
  factory _PlantAnatomy.fromJson(Map<String, dynamic> json) =>
      _$PlantAnatomyFromJson(json);

  @override
  final String? part;
  final List<String>? _color;
  @override
  List<String>? get color {
    final value = _color;
    if (value == null) return null;
    if (_color is EqualUnmodifiableListView) return _color;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of PlantAnatomy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantAnatomyCopyWith<_PlantAnatomy> get copyWith =>
      __$PlantAnatomyCopyWithImpl<_PlantAnatomy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantAnatomyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantAnatomy &&
            (identical(other.part, part) || other.part == part) &&
            const DeepCollectionEquality().equals(other._color, _color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, part, const DeepCollectionEquality().hash(_color));

  @override
  String toString() {
    return 'PlantAnatomy(part: $part, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$PlantAnatomyCopyWith<$Res>
    implements $PlantAnatomyCopyWith<$Res> {
  factory _$PlantAnatomyCopyWith(
          _PlantAnatomy value, $Res Function(_PlantAnatomy) _then) =
      __$PlantAnatomyCopyWithImpl;
  @override
  @useResult
  $Res call({String? part, List<String>? color});
}

/// @nodoc
class __$PlantAnatomyCopyWithImpl<$Res>
    implements _$PlantAnatomyCopyWith<$Res> {
  __$PlantAnatomyCopyWithImpl(this._self, this._then);

  final _PlantAnatomy _self;
  final $Res Function(_PlantAnatomy) _then;

  /// Create a copy of PlantAnatomy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? part = freezed,
    Object? color = freezed,
  }) {
    return _then(_PlantAnatomy(
      part: freezed == part
          ? _self.part
          : part // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _self._color
          : color // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$PruningCount {
  int? get amount;
  String? get interval;

  /// Create a copy of PruningCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PruningCountCopyWith<PruningCount> get copyWith =>
      _$PruningCountCopyWithImpl<PruningCount>(
          this as PruningCount, _$identity);

  /// Serializes this PruningCount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PruningCount &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.interval, interval) ||
                other.interval == interval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, interval);

  @override
  String toString() {
    return 'PruningCount(amount: $amount, interval: $interval)';
  }
}

/// @nodoc
abstract mixin class $PruningCountCopyWith<$Res> {
  factory $PruningCountCopyWith(
          PruningCount value, $Res Function(PruningCount) _then) =
      _$PruningCountCopyWithImpl;
  @useResult
  $Res call({int? amount, String? interval});
}

/// @nodoc
class _$PruningCountCopyWithImpl<$Res> implements $PruningCountCopyWith<$Res> {
  _$PruningCountCopyWithImpl(this._self, this._then);

  final PruningCount _self;
  final $Res Function(PruningCount) _then;

  /// Create a copy of PruningCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? interval = freezed,
  }) {
    return _then(_self.copyWith(
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      interval: freezed == interval
          ? _self.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PruningCount implements PruningCount {
  const _PruningCount({this.amount, this.interval});
  factory _PruningCount.fromJson(Map<String, dynamic> json) =>
      _$PruningCountFromJson(json);

  @override
  final int? amount;
  @override
  final String? interval;

  /// Create a copy of PruningCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PruningCountCopyWith<_PruningCount> get copyWith =>
      __$PruningCountCopyWithImpl<_PruningCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PruningCountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PruningCount &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.interval, interval) ||
                other.interval == interval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, interval);

  @override
  String toString() {
    return 'PruningCount(amount: $amount, interval: $interval)';
  }
}

/// @nodoc
abstract mixin class _$PruningCountCopyWith<$Res>
    implements $PruningCountCopyWith<$Res> {
  factory _$PruningCountCopyWith(
          _PruningCount value, $Res Function(_PruningCount) _then) =
      __$PruningCountCopyWithImpl;
  @override
  @useResult
  $Res call({int? amount, String? interval});
}

/// @nodoc
class __$PruningCountCopyWithImpl<$Res>
    implements _$PruningCountCopyWith<$Res> {
  __$PruningCountCopyWithImpl(this._self, this._then);

  final _PruningCount _self;
  final $Res Function(_PruningCount) _then;

  /// Create a copy of PruningCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? amount = freezed,
    Object? interval = freezed,
  }) {
    return _then(_PruningCount(
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      interval: freezed == interval
          ? _self.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Hardiness {
  String? get min;
  String? get max;

  /// Create a copy of Hardiness
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardinessCopyWith<Hardiness> get copyWith =>
      _$HardinessCopyWithImpl<Hardiness>(this as Hardiness, _$identity);

  /// Serializes this Hardiness to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Hardiness &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @override
  String toString() {
    return 'Hardiness(min: $min, max: $max)';
  }
}

/// @nodoc
abstract mixin class $HardinessCopyWith<$Res> {
  factory $HardinessCopyWith(Hardiness value, $Res Function(Hardiness) _then) =
      _$HardinessCopyWithImpl;
  @useResult
  $Res call({String? min, String? max});
}

/// @nodoc
class _$HardinessCopyWithImpl<$Res> implements $HardinessCopyWith<$Res> {
  _$HardinessCopyWithImpl(this._self, this._then);

  final Hardiness _self;
  final $Res Function(Hardiness) _then;

  /// Create a copy of Hardiness
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_self.copyWith(
      min: freezed == min
          ? _self.min
          : min // ignore: cast_nullable_to_non_nullable
              as String?,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Hardiness implements Hardiness {
  const _Hardiness({this.min, this.max});
  factory _Hardiness.fromJson(Map<String, dynamic> json) =>
      _$HardinessFromJson(json);

  @override
  final String? min;
  @override
  final String? max;

  /// Create a copy of Hardiness
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HardinessCopyWith<_Hardiness> get copyWith =>
      __$HardinessCopyWithImpl<_Hardiness>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HardinessToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Hardiness &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, min, max);

  @override
  String toString() {
    return 'Hardiness(min: $min, max: $max)';
  }
}

/// @nodoc
abstract mixin class _$HardinessCopyWith<$Res>
    implements $HardinessCopyWith<$Res> {
  factory _$HardinessCopyWith(
          _Hardiness value, $Res Function(_Hardiness) _then) =
      __$HardinessCopyWithImpl;
  @override
  @useResult
  $Res call({String? min, String? max});
}

/// @nodoc
class __$HardinessCopyWithImpl<$Res> implements _$HardinessCopyWith<$Res> {
  __$HardinessCopyWithImpl(this._self, this._then);

  final _Hardiness _self;
  final $Res Function(_Hardiness) _then;

  /// Create a copy of Hardiness
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_Hardiness(
      min: freezed == min
          ? _self.min
          : min // ignore: cast_nullable_to_non_nullable
              as String?,
      max: freezed == max
          ? _self.max
          : max // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$HardinessLocation {
  String? get fullUrl;
  String? get fullIframe;

  /// Create a copy of HardinessLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HardinessLocationCopyWith<HardinessLocation> get copyWith =>
      _$HardinessLocationCopyWithImpl<HardinessLocation>(
          this as HardinessLocation, _$identity);

  /// Serializes this HardinessLocation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HardinessLocation &&
            (identical(other.fullUrl, fullUrl) || other.fullUrl == fullUrl) &&
            (identical(other.fullIframe, fullIframe) ||
                other.fullIframe == fullIframe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullUrl, fullIframe);

  @override
  String toString() {
    return 'HardinessLocation(fullUrl: $fullUrl, fullIframe: $fullIframe)';
  }
}

/// @nodoc
abstract mixin class $HardinessLocationCopyWith<$Res> {
  factory $HardinessLocationCopyWith(
          HardinessLocation value, $Res Function(HardinessLocation) _then) =
      _$HardinessLocationCopyWithImpl;
  @useResult
  $Res call({String? fullUrl, String? fullIframe});
}

/// @nodoc
class _$HardinessLocationCopyWithImpl<$Res>
    implements $HardinessLocationCopyWith<$Res> {
  _$HardinessLocationCopyWithImpl(this._self, this._then);

  final HardinessLocation _self;
  final $Res Function(HardinessLocation) _then;

  /// Create a copy of HardinessLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullUrl = freezed,
    Object? fullIframe = freezed,
  }) {
    return _then(_self.copyWith(
      fullUrl: freezed == fullUrl
          ? _self.fullUrl
          : fullUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fullIframe: freezed == fullIframe
          ? _self.fullIframe
          : fullIframe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HardinessLocation implements HardinessLocation {
  const _HardinessLocation({this.fullUrl, this.fullIframe});
  factory _HardinessLocation.fromJson(Map<String, dynamic> json) =>
      _$HardinessLocationFromJson(json);

  @override
  final String? fullUrl;
  @override
  final String? fullIframe;

  /// Create a copy of HardinessLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HardinessLocationCopyWith<_HardinessLocation> get copyWith =>
      __$HardinessLocationCopyWithImpl<_HardinessLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HardinessLocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HardinessLocation &&
            (identical(other.fullUrl, fullUrl) || other.fullUrl == fullUrl) &&
            (identical(other.fullIframe, fullIframe) ||
                other.fullIframe == fullIframe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullUrl, fullIframe);

  @override
  String toString() {
    return 'HardinessLocation(fullUrl: $fullUrl, fullIframe: $fullIframe)';
  }
}

/// @nodoc
abstract mixin class _$HardinessLocationCopyWith<$Res>
    implements $HardinessLocationCopyWith<$Res> {
  factory _$HardinessLocationCopyWith(
          _HardinessLocation value, $Res Function(_HardinessLocation) _then) =
      __$HardinessLocationCopyWithImpl;
  @override
  @useResult
  $Res call({String? fullUrl, String? fullIframe});
}

/// @nodoc
class __$HardinessLocationCopyWithImpl<$Res>
    implements _$HardinessLocationCopyWith<$Res> {
  __$HardinessLocationCopyWithImpl(this._self, this._then);

  final _HardinessLocation _self;
  final $Res Function(_HardinessLocation) _then;

  /// Create a copy of HardinessLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fullUrl = freezed,
    Object? fullIframe = freezed,
  }) {
    return _then(_HardinessLocation(
      fullUrl: freezed == fullUrl
          ? _self.fullUrl
          : fullUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fullIframe: freezed == fullIframe
          ? _self.fullIframe
          : fullIframe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ImageData {
  int? get license;
  String? get licenseName;
  String? get licenseUrl;
  String? get originalUrl;
  String? get regularUrl;
  String? get mediumUrl;
  String? get smallUrl;
  String? get thumbnail;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageDataCopyWith<ImageData> get copyWith =>
      _$ImageDataCopyWithImpl<ImageData>(this as ImageData, _$identity);

  /// Serializes this ImageData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageData &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.licenseName, licenseName) ||
                other.licenseName == licenseName) &&
            (identical(other.licenseUrl, licenseUrl) ||
                other.licenseUrl == licenseUrl) &&
            (identical(other.originalUrl, originalUrl) ||
                other.originalUrl == originalUrl) &&
            (identical(other.regularUrl, regularUrl) ||
                other.regularUrl == regularUrl) &&
            (identical(other.mediumUrl, mediumUrl) ||
                other.mediumUrl == mediumUrl) &&
            (identical(other.smallUrl, smallUrl) ||
                other.smallUrl == smallUrl) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, license, licenseName, licenseUrl,
      originalUrl, regularUrl, mediumUrl, smallUrl, thumbnail);

  @override
  String toString() {
    return 'ImageData(license: $license, licenseName: $licenseName, licenseUrl: $licenseUrl, originalUrl: $originalUrl, regularUrl: $regularUrl, mediumUrl: $mediumUrl, smallUrl: $smallUrl, thumbnail: $thumbnail)';
  }
}

/// @nodoc
abstract mixin class $ImageDataCopyWith<$Res> {
  factory $ImageDataCopyWith(ImageData value, $Res Function(ImageData) _then) =
      _$ImageDataCopyWithImpl;
  @useResult
  $Res call(
      {int? license,
      String? licenseName,
      String? licenseUrl,
      String? originalUrl,
      String? regularUrl,
      String? mediumUrl,
      String? smallUrl,
      String? thumbnail});
}

/// @nodoc
class _$ImageDataCopyWithImpl<$Res> implements $ImageDataCopyWith<$Res> {
  _$ImageDataCopyWithImpl(this._self, this._then);

  final ImageData _self;
  final $Res Function(ImageData) _then;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? license = freezed,
    Object? licenseName = freezed,
    Object? licenseUrl = freezed,
    Object? originalUrl = freezed,
    Object? regularUrl = freezed,
    Object? mediumUrl = freezed,
    Object? smallUrl = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_self.copyWith(
      license: freezed == license
          ? _self.license
          : license // ignore: cast_nullable_to_non_nullable
              as int?,
      licenseName: freezed == licenseName
          ? _self.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseUrl: freezed == licenseUrl
          ? _self.licenseUrl
          : licenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      originalUrl: freezed == originalUrl
          ? _self.originalUrl
          : originalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      regularUrl: freezed == regularUrl
          ? _self.regularUrl
          : regularUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediumUrl: freezed == mediumUrl
          ? _self.mediumUrl
          : mediumUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      smallUrl: freezed == smallUrl
          ? _self.smallUrl
          : smallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ImageData implements ImageData {
  const _ImageData(
      {this.license,
      this.licenseName,
      this.licenseUrl,
      this.originalUrl,
      this.regularUrl,
      this.mediumUrl,
      this.smallUrl,
      this.thumbnail});
  factory _ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  @override
  final int? license;
  @override
  final String? licenseName;
  @override
  final String? licenseUrl;
  @override
  final String? originalUrl;
  @override
  final String? regularUrl;
  @override
  final String? mediumUrl;
  @override
  final String? smallUrl;
  @override
  final String? thumbnail;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageDataCopyWith<_ImageData> get copyWith =>
      __$ImageDataCopyWithImpl<_ImageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageData &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.licenseName, licenseName) ||
                other.licenseName == licenseName) &&
            (identical(other.licenseUrl, licenseUrl) ||
                other.licenseUrl == licenseUrl) &&
            (identical(other.originalUrl, originalUrl) ||
                other.originalUrl == originalUrl) &&
            (identical(other.regularUrl, regularUrl) ||
                other.regularUrl == regularUrl) &&
            (identical(other.mediumUrl, mediumUrl) ||
                other.mediumUrl == mediumUrl) &&
            (identical(other.smallUrl, smallUrl) ||
                other.smallUrl == smallUrl) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, license, licenseName, licenseUrl,
      originalUrl, regularUrl, mediumUrl, smallUrl, thumbnail);

  @override
  String toString() {
    return 'ImageData(license: $license, licenseName: $licenseName, licenseUrl: $licenseUrl, originalUrl: $originalUrl, regularUrl: $regularUrl, mediumUrl: $mediumUrl, smallUrl: $smallUrl, thumbnail: $thumbnail)';
  }
}

/// @nodoc
abstract mixin class _$ImageDataCopyWith<$Res>
    implements $ImageDataCopyWith<$Res> {
  factory _$ImageDataCopyWith(
          _ImageData value, $Res Function(_ImageData) _then) =
      __$ImageDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? license,
      String? licenseName,
      String? licenseUrl,
      String? originalUrl,
      String? regularUrl,
      String? mediumUrl,
      String? smallUrl,
      String? thumbnail});
}

/// @nodoc
class __$ImageDataCopyWithImpl<$Res> implements _$ImageDataCopyWith<$Res> {
  __$ImageDataCopyWithImpl(this._self, this._then);

  final _ImageData _self;
  final $Res Function(_ImageData) _then;

  /// Create a copy of ImageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? license = freezed,
    Object? licenseName = freezed,
    Object? licenseUrl = freezed,
    Object? originalUrl = freezed,
    Object? regularUrl = freezed,
    Object? mediumUrl = freezed,
    Object? smallUrl = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_ImageData(
      license: freezed == license
          ? _self.license
          : license // ignore: cast_nullable_to_non_nullable
              as int?,
      licenseName: freezed == licenseName
          ? _self.licenseName
          : licenseName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseUrl: freezed == licenseUrl
          ? _self.licenseUrl
          : licenseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      originalUrl: freezed == originalUrl
          ? _self.originalUrl
          : originalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      regularUrl: freezed == regularUrl
          ? _self.regularUrl
          : regularUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediumUrl: freezed == mediumUrl
          ? _self.mediumUrl
          : mediumUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      smallUrl: freezed == smallUrl
          ? _self.smallUrl
          : smallUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _self.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
