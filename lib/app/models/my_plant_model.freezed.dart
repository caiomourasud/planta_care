// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_plant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyPlantModel {
  String? get id;
  String? get name;
  String? get description;
  List<String>? get images;
  LastWatered? get lastWatered;
  DateTime? get lastWatering;
  DateTime? get lastFertilization;
  String? get deviceId;
  DateTime? get deviceAddedAt;
  String? get locationId;
  int? get plantId;
  PlantHealthStatus? get healthStatus;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  Category? get category;
  String? get localUrl;
  PlantMaintenanceDifficulty? get maintenanceDifficulty;
  WateringNeeds? get wateringNeeds;
  LightNeeds? get lightNeeds;
  ToxicityLevel? get toxicity;

  /// Create a copy of MyPlantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyPlantModelCopyWith<MyPlantModel> get copyWith =>
      _$MyPlantModelCopyWithImpl<MyPlantModel>(
          this as MyPlantModel, _$identity);

  /// Serializes this MyPlantModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyPlantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.lastWatered, lastWatered) ||
                other.lastWatered == lastWatered) &&
            (identical(other.lastWatering, lastWatering) ||
                other.lastWatering == lastWatering) &&
            (identical(other.lastFertilization, lastFertilization) ||
                other.lastFertilization == lastFertilization) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceAddedAt, deviceAddedAt) ||
                other.deviceAddedAt == deviceAddedAt) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.localUrl, localUrl) ||
                other.localUrl == localUrl) &&
            (identical(other.maintenanceDifficulty, maintenanceDifficulty) ||
                other.maintenanceDifficulty == maintenanceDifficulty) &&
            (identical(other.wateringNeeds, wateringNeeds) ||
                other.wateringNeeds == wateringNeeds) &&
            (identical(other.lightNeeds, lightNeeds) ||
                other.lightNeeds == lightNeeds) &&
            (identical(other.toxicity, toxicity) ||
                other.toxicity == toxicity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        const DeepCollectionEquality().hash(images),
        lastWatered,
        lastWatering,
        lastFertilization,
        deviceId,
        deviceAddedAt,
        locationId,
        plantId,
        healthStatus,
        createdAt,
        updatedAt,
        category,
        localUrl,
        maintenanceDifficulty,
        wateringNeeds,
        lightNeeds,
        toxicity
      ]);

  @override
  String toString() {
    return 'MyPlantModel(id: $id, name: $name, description: $description, images: $images, lastWatered: $lastWatered, lastWatering: $lastWatering, lastFertilization: $lastFertilization, deviceId: $deviceId, deviceAddedAt: $deviceAddedAt, locationId: $locationId, plantId: $plantId, healthStatus: $healthStatus, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, localUrl: $localUrl, maintenanceDifficulty: $maintenanceDifficulty, wateringNeeds: $wateringNeeds, lightNeeds: $lightNeeds, toxicity: $toxicity)';
  }
}

/// @nodoc
abstract mixin class $MyPlantModelCopyWith<$Res> {
  factory $MyPlantModelCopyWith(
          MyPlantModel value, $Res Function(MyPlantModel) _then) =
      _$MyPlantModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
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
      PlantMaintenanceDifficulty? maintenanceDifficulty,
      WateringNeeds? wateringNeeds,
      LightNeeds? lightNeeds,
      ToxicityLevel? toxicity});
}

/// @nodoc
class _$MyPlantModelCopyWithImpl<$Res> implements $MyPlantModelCopyWith<$Res> {
  _$MyPlantModelCopyWithImpl(this._self, this._then);

  final MyPlantModel _self;
  final $Res Function(MyPlantModel) _then;

  /// Create a copy of MyPlantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? lastWatered = freezed,
    Object? lastWatering = freezed,
    Object? lastFertilization = freezed,
    Object? deviceId = freezed,
    Object? deviceAddedAt = freezed,
    Object? locationId = freezed,
    Object? plantId = freezed,
    Object? healthStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? localUrl = freezed,
    Object? maintenanceDifficulty = freezed,
    Object? wateringNeeds = freezed,
    Object? lightNeeds = freezed,
    Object? toxicity = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastWatered: freezed == lastWatered
          ? _self.lastWatered
          : lastWatered // ignore: cast_nullable_to_non_nullable
              as LastWatered?,
      lastWatering: freezed == lastWatering
          ? _self.lastWatering
          : lastWatering // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFertilization: freezed == lastFertilization
          ? _self.lastFertilization
          : lastFertilization // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceAddedAt: freezed == deviceAddedAt
          ? _self.deviceAddedAt
          : deviceAddedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      plantId: freezed == plantId
          ? _self.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as int?,
      healthStatus: freezed == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as PlantHealthStatus?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      localUrl: freezed == localUrl
          ? _self.localUrl
          : localUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maintenanceDifficulty: freezed == maintenanceDifficulty
          ? _self.maintenanceDifficulty
          : maintenanceDifficulty // ignore: cast_nullable_to_non_nullable
              as PlantMaintenanceDifficulty?,
      wateringNeeds: freezed == wateringNeeds
          ? _self.wateringNeeds
          : wateringNeeds // ignore: cast_nullable_to_non_nullable
              as WateringNeeds?,
      lightNeeds: freezed == lightNeeds
          ? _self.lightNeeds
          : lightNeeds // ignore: cast_nullable_to_non_nullable
              as LightNeeds?,
      toxicity: freezed == toxicity
          ? _self.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as ToxicityLevel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MyPlantModel implements MyPlantModel {
  const _MyPlantModel(
      {this.id,
      this.name,
      this.description,
      final List<String>? images,
      this.lastWatered,
      this.lastWatering,
      this.lastFertilization,
      this.deviceId,
      this.deviceAddedAt,
      this.locationId,
      this.plantId,
      this.healthStatus,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.localUrl,
      this.maintenanceDifficulty = PlantMaintenanceDifficulty.easy,
      this.wateringNeeds = WateringNeeds.low,
      this.lightNeeds = LightNeeds.low,
      this.toxicity = ToxicityLevel.nonToxic})
      : _images = images;
  factory _MyPlantModel.fromJson(Map<String, dynamic> json) =>
      _$MyPlantModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LastWatered? lastWatered;
  @override
  final DateTime? lastWatering;
  @override
  final DateTime? lastFertilization;
  @override
  final String? deviceId;
  @override
  final DateTime? deviceAddedAt;
  @override
  final String? locationId;
  @override
  final int? plantId;
  @override
  final PlantHealthStatus? healthStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final Category? category;
  @override
  final String? localUrl;
  @override
  @JsonKey()
  final PlantMaintenanceDifficulty? maintenanceDifficulty;
  @override
  @JsonKey()
  final WateringNeeds? wateringNeeds;
  @override
  @JsonKey()
  final LightNeeds? lightNeeds;
  @override
  @JsonKey()
  final ToxicityLevel? toxicity;

  /// Create a copy of MyPlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyPlantModelCopyWith<_MyPlantModel> get copyWith =>
      __$MyPlantModelCopyWithImpl<_MyPlantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MyPlantModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyPlantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.lastWatered, lastWatered) ||
                other.lastWatered == lastWatered) &&
            (identical(other.lastWatering, lastWatering) ||
                other.lastWatering == lastWatering) &&
            (identical(other.lastFertilization, lastFertilization) ||
                other.lastFertilization == lastFertilization) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceAddedAt, deviceAddedAt) ||
                other.deviceAddedAt == deviceAddedAt) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.healthStatus, healthStatus) ||
                other.healthStatus == healthStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.localUrl, localUrl) ||
                other.localUrl == localUrl) &&
            (identical(other.maintenanceDifficulty, maintenanceDifficulty) ||
                other.maintenanceDifficulty == maintenanceDifficulty) &&
            (identical(other.wateringNeeds, wateringNeeds) ||
                other.wateringNeeds == wateringNeeds) &&
            (identical(other.lightNeeds, lightNeeds) ||
                other.lightNeeds == lightNeeds) &&
            (identical(other.toxicity, toxicity) ||
                other.toxicity == toxicity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        const DeepCollectionEquality().hash(_images),
        lastWatered,
        lastWatering,
        lastFertilization,
        deviceId,
        deviceAddedAt,
        locationId,
        plantId,
        healthStatus,
        createdAt,
        updatedAt,
        category,
        localUrl,
        maintenanceDifficulty,
        wateringNeeds,
        lightNeeds,
        toxicity
      ]);

  @override
  String toString() {
    return 'MyPlantModel(id: $id, name: $name, description: $description, images: $images, lastWatered: $lastWatered, lastWatering: $lastWatering, lastFertilization: $lastFertilization, deviceId: $deviceId, deviceAddedAt: $deviceAddedAt, locationId: $locationId, plantId: $plantId, healthStatus: $healthStatus, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, localUrl: $localUrl, maintenanceDifficulty: $maintenanceDifficulty, wateringNeeds: $wateringNeeds, lightNeeds: $lightNeeds, toxicity: $toxicity)';
  }
}

/// @nodoc
abstract mixin class _$MyPlantModelCopyWith<$Res>
    implements $MyPlantModelCopyWith<$Res> {
  factory _$MyPlantModelCopyWith(
          _MyPlantModel value, $Res Function(_MyPlantModel) _then) =
      __$MyPlantModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
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
      PlantMaintenanceDifficulty? maintenanceDifficulty,
      WateringNeeds? wateringNeeds,
      LightNeeds? lightNeeds,
      ToxicityLevel? toxicity});
}

/// @nodoc
class __$MyPlantModelCopyWithImpl<$Res>
    implements _$MyPlantModelCopyWith<$Res> {
  __$MyPlantModelCopyWithImpl(this._self, this._then);

  final _MyPlantModel _self;
  final $Res Function(_MyPlantModel) _then;

  /// Create a copy of MyPlantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? images = freezed,
    Object? lastWatered = freezed,
    Object? lastWatering = freezed,
    Object? lastFertilization = freezed,
    Object? deviceId = freezed,
    Object? deviceAddedAt = freezed,
    Object? locationId = freezed,
    Object? plantId = freezed,
    Object? healthStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? localUrl = freezed,
    Object? maintenanceDifficulty = freezed,
    Object? wateringNeeds = freezed,
    Object? lightNeeds = freezed,
    Object? toxicity = freezed,
  }) {
    return _then(_MyPlantModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lastWatered: freezed == lastWatered
          ? _self.lastWatered
          : lastWatered // ignore: cast_nullable_to_non_nullable
              as LastWatered?,
      lastWatering: freezed == lastWatering
          ? _self.lastWatering
          : lastWatering // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFertilization: freezed == lastFertilization
          ? _self.lastFertilization
          : lastFertilization // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceAddedAt: freezed == deviceAddedAt
          ? _self.deviceAddedAt
          : deviceAddedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      plantId: freezed == plantId
          ? _self.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as int?,
      healthStatus: freezed == healthStatus
          ? _self.healthStatus
          : healthStatus // ignore: cast_nullable_to_non_nullable
              as PlantHealthStatus?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      localUrl: freezed == localUrl
          ? _self.localUrl
          : localUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maintenanceDifficulty: freezed == maintenanceDifficulty
          ? _self.maintenanceDifficulty
          : maintenanceDifficulty // ignore: cast_nullable_to_non_nullable
              as PlantMaintenanceDifficulty?,
      wateringNeeds: freezed == wateringNeeds
          ? _self.wateringNeeds
          : wateringNeeds // ignore: cast_nullable_to_non_nullable
              as WateringNeeds?,
      lightNeeds: freezed == lightNeeds
          ? _self.lightNeeds
          : lightNeeds // ignore: cast_nullable_to_non_nullable
              as LightNeeds?,
      toxicity: freezed == toxicity
          ? _self.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as ToxicityLevel?,
    ));
  }
}

// dart format on
