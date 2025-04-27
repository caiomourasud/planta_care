// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_care_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantCare {
  PlantMaintenanceDifficulty? get maintenanceDifficulty;
  String? get maintenanceDescription;
  WateringNeeds? get wateringNeeds;
  String? get wateringDescription;
  int? get wateringFrequencyDays;
  int? get wateringMoistureThreshold;
  LightNeeds? get lightNeeds;
  String? get lightDescription;
  int? get lightFrequencyDays;
  ToxicityLevel? get toxicity;
  String? get toxicityDescription;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantCareCopyWith<PlantCare> get copyWith =>
      _$PlantCareCopyWithImpl<PlantCare>(this as PlantCare, _$identity);

  /// Serializes this PlantCare to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantCare &&
            (identical(other.maintenanceDifficulty, maintenanceDifficulty) ||
                other.maintenanceDifficulty == maintenanceDifficulty) &&
            (identical(other.maintenanceDescription, maintenanceDescription) ||
                other.maintenanceDescription == maintenanceDescription) &&
            (identical(other.wateringNeeds, wateringNeeds) ||
                other.wateringNeeds == wateringNeeds) &&
            (identical(other.wateringDescription, wateringDescription) ||
                other.wateringDescription == wateringDescription) &&
            (identical(other.wateringFrequencyDays, wateringFrequencyDays) ||
                other.wateringFrequencyDays == wateringFrequencyDays) &&
            (identical(other.wateringMoistureThreshold,
                    wateringMoistureThreshold) ||
                other.wateringMoistureThreshold == wateringMoistureThreshold) &&
            (identical(other.lightNeeds, lightNeeds) ||
                other.lightNeeds == lightNeeds) &&
            (identical(other.lightDescription, lightDescription) ||
                other.lightDescription == lightDescription) &&
            (identical(other.lightFrequencyDays, lightFrequencyDays) ||
                other.lightFrequencyDays == lightFrequencyDays) &&
            (identical(other.toxicity, toxicity) ||
                other.toxicity == toxicity) &&
            (identical(other.toxicityDescription, toxicityDescription) ||
                other.toxicityDescription == toxicityDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      maintenanceDifficulty,
      maintenanceDescription,
      wateringNeeds,
      wateringDescription,
      wateringFrequencyDays,
      wateringMoistureThreshold,
      lightNeeds,
      lightDescription,
      lightFrequencyDays,
      toxicity,
      toxicityDescription);

  @override
  String toString() {
    return 'PlantCare(maintenanceDifficulty: $maintenanceDifficulty, maintenanceDescription: $maintenanceDescription, wateringNeeds: $wateringNeeds, wateringDescription: $wateringDescription, wateringFrequencyDays: $wateringFrequencyDays, wateringMoistureThreshold: $wateringMoistureThreshold, lightNeeds: $lightNeeds, lightDescription: $lightDescription, lightFrequencyDays: $lightFrequencyDays, toxicity: $toxicity, toxicityDescription: $toxicityDescription)';
  }
}

/// @nodoc
abstract mixin class $PlantCareCopyWith<$Res> {
  factory $PlantCareCopyWith(PlantCare value, $Res Function(PlantCare) _then) =
      _$PlantCareCopyWithImpl;
  @useResult
  $Res call(
      {PlantMaintenanceDifficulty? maintenanceDifficulty,
      String? maintenanceDescription,
      WateringNeeds? wateringNeeds,
      String? wateringDescription,
      int? wateringFrequencyDays,
      int? wateringMoistureThreshold,
      LightNeeds? lightNeeds,
      String? lightDescription,
      int? lightFrequencyDays,
      ToxicityLevel? toxicity,
      String? toxicityDescription});
}

/// @nodoc
class _$PlantCareCopyWithImpl<$Res> implements $PlantCareCopyWith<$Res> {
  _$PlantCareCopyWithImpl(this._self, this._then);

  final PlantCare _self;
  final $Res Function(PlantCare) _then;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maintenanceDifficulty = freezed,
    Object? maintenanceDescription = freezed,
    Object? wateringNeeds = freezed,
    Object? wateringDescription = freezed,
    Object? wateringFrequencyDays = freezed,
    Object? wateringMoistureThreshold = freezed,
    Object? lightNeeds = freezed,
    Object? lightDescription = freezed,
    Object? lightFrequencyDays = freezed,
    Object? toxicity = freezed,
    Object? toxicityDescription = freezed,
  }) {
    return _then(_self.copyWith(
      maintenanceDifficulty: freezed == maintenanceDifficulty
          ? _self.maintenanceDifficulty
          : maintenanceDifficulty // ignore: cast_nullable_to_non_nullable
              as PlantMaintenanceDifficulty?,
      maintenanceDescription: freezed == maintenanceDescription
          ? _self.maintenanceDescription
          : maintenanceDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringNeeds: freezed == wateringNeeds
          ? _self.wateringNeeds
          : wateringNeeds // ignore: cast_nullable_to_non_nullable
              as WateringNeeds?,
      wateringDescription: freezed == wateringDescription
          ? _self.wateringDescription
          : wateringDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringFrequencyDays: freezed == wateringFrequencyDays
          ? _self.wateringFrequencyDays
          : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      wateringMoistureThreshold: freezed == wateringMoistureThreshold
          ? _self.wateringMoistureThreshold
          : wateringMoistureThreshold // ignore: cast_nullable_to_non_nullable
              as int?,
      lightNeeds: freezed == lightNeeds
          ? _self.lightNeeds
          : lightNeeds // ignore: cast_nullable_to_non_nullable
              as LightNeeds?,
      lightDescription: freezed == lightDescription
          ? _self.lightDescription
          : lightDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      lightFrequencyDays: freezed == lightFrequencyDays
          ? _self.lightFrequencyDays
          : lightFrequencyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      toxicity: freezed == toxicity
          ? _self.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as ToxicityLevel?,
      toxicityDescription: freezed == toxicityDescription
          ? _self.toxicityDescription
          : toxicityDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _PlantCare implements PlantCare {
  const _PlantCare(
      {this.maintenanceDifficulty = PlantMaintenanceDifficulty.easy,
      this.maintenanceDescription,
      this.wateringNeeds = WateringNeeds.low,
      this.wateringDescription,
      this.wateringFrequencyDays = 0,
      this.wateringMoistureThreshold = 0,
      this.lightNeeds = LightNeeds.low,
      this.lightDescription,
      this.lightFrequencyDays = 0,
      this.toxicity = ToxicityLevel.toxic,
      this.toxicityDescription});
  factory _PlantCare.fromJson(Map<String, dynamic> json) =>
      _$PlantCareFromJson(json);

  @override
  @JsonKey()
  final PlantMaintenanceDifficulty? maintenanceDifficulty;
  @override
  final String? maintenanceDescription;
  @override
  @JsonKey()
  final WateringNeeds? wateringNeeds;
  @override
  final String? wateringDescription;
  @override
  @JsonKey()
  final int? wateringFrequencyDays;
  @override
  @JsonKey()
  final int? wateringMoistureThreshold;
  @override
  @JsonKey()
  final LightNeeds? lightNeeds;
  @override
  final String? lightDescription;
  @override
  @JsonKey()
  final int? lightFrequencyDays;
  @override
  @JsonKey()
  final ToxicityLevel? toxicity;
  @override
  final String? toxicityDescription;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantCareCopyWith<_PlantCare> get copyWith =>
      __$PlantCareCopyWithImpl<_PlantCare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantCareToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantCare &&
            (identical(other.maintenanceDifficulty, maintenanceDifficulty) ||
                other.maintenanceDifficulty == maintenanceDifficulty) &&
            (identical(other.maintenanceDescription, maintenanceDescription) ||
                other.maintenanceDescription == maintenanceDescription) &&
            (identical(other.wateringNeeds, wateringNeeds) ||
                other.wateringNeeds == wateringNeeds) &&
            (identical(other.wateringDescription, wateringDescription) ||
                other.wateringDescription == wateringDescription) &&
            (identical(other.wateringFrequencyDays, wateringFrequencyDays) ||
                other.wateringFrequencyDays == wateringFrequencyDays) &&
            (identical(other.wateringMoistureThreshold,
                    wateringMoistureThreshold) ||
                other.wateringMoistureThreshold == wateringMoistureThreshold) &&
            (identical(other.lightNeeds, lightNeeds) ||
                other.lightNeeds == lightNeeds) &&
            (identical(other.lightDescription, lightDescription) ||
                other.lightDescription == lightDescription) &&
            (identical(other.lightFrequencyDays, lightFrequencyDays) ||
                other.lightFrequencyDays == lightFrequencyDays) &&
            (identical(other.toxicity, toxicity) ||
                other.toxicity == toxicity) &&
            (identical(other.toxicityDescription, toxicityDescription) ||
                other.toxicityDescription == toxicityDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      maintenanceDifficulty,
      maintenanceDescription,
      wateringNeeds,
      wateringDescription,
      wateringFrequencyDays,
      wateringMoistureThreshold,
      lightNeeds,
      lightDescription,
      lightFrequencyDays,
      toxicity,
      toxicityDescription);

  @override
  String toString() {
    return 'PlantCare(maintenanceDifficulty: $maintenanceDifficulty, maintenanceDescription: $maintenanceDescription, wateringNeeds: $wateringNeeds, wateringDescription: $wateringDescription, wateringFrequencyDays: $wateringFrequencyDays, wateringMoistureThreshold: $wateringMoistureThreshold, lightNeeds: $lightNeeds, lightDescription: $lightDescription, lightFrequencyDays: $lightFrequencyDays, toxicity: $toxicity, toxicityDescription: $toxicityDescription)';
  }
}

/// @nodoc
abstract mixin class _$PlantCareCopyWith<$Res>
    implements $PlantCareCopyWith<$Res> {
  factory _$PlantCareCopyWith(
          _PlantCare value, $Res Function(_PlantCare) _then) =
      __$PlantCareCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PlantMaintenanceDifficulty? maintenanceDifficulty,
      String? maintenanceDescription,
      WateringNeeds? wateringNeeds,
      String? wateringDescription,
      int? wateringFrequencyDays,
      int? wateringMoistureThreshold,
      LightNeeds? lightNeeds,
      String? lightDescription,
      int? lightFrequencyDays,
      ToxicityLevel? toxicity,
      String? toxicityDescription});
}

/// @nodoc
class __$PlantCareCopyWithImpl<$Res> implements _$PlantCareCopyWith<$Res> {
  __$PlantCareCopyWithImpl(this._self, this._then);

  final _PlantCare _self;
  final $Res Function(_PlantCare) _then;

  /// Create a copy of PlantCare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? maintenanceDifficulty = freezed,
    Object? maintenanceDescription = freezed,
    Object? wateringNeeds = freezed,
    Object? wateringDescription = freezed,
    Object? wateringFrequencyDays = freezed,
    Object? wateringMoistureThreshold = freezed,
    Object? lightNeeds = freezed,
    Object? lightDescription = freezed,
    Object? lightFrequencyDays = freezed,
    Object? toxicity = freezed,
    Object? toxicityDescription = freezed,
  }) {
    return _then(_PlantCare(
      maintenanceDifficulty: freezed == maintenanceDifficulty
          ? _self.maintenanceDifficulty
          : maintenanceDifficulty // ignore: cast_nullable_to_non_nullable
              as PlantMaintenanceDifficulty?,
      maintenanceDescription: freezed == maintenanceDescription
          ? _self.maintenanceDescription
          : maintenanceDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringNeeds: freezed == wateringNeeds
          ? _self.wateringNeeds
          : wateringNeeds // ignore: cast_nullable_to_non_nullable
              as WateringNeeds?,
      wateringDescription: freezed == wateringDescription
          ? _self.wateringDescription
          : wateringDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      wateringFrequencyDays: freezed == wateringFrequencyDays
          ? _self.wateringFrequencyDays
          : wateringFrequencyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      wateringMoistureThreshold: freezed == wateringMoistureThreshold
          ? _self.wateringMoistureThreshold
          : wateringMoistureThreshold // ignore: cast_nullable_to_non_nullable
              as int?,
      lightNeeds: freezed == lightNeeds
          ? _self.lightNeeds
          : lightNeeds // ignore: cast_nullable_to_non_nullable
              as LightNeeds?,
      lightDescription: freezed == lightDescription
          ? _self.lightDescription
          : lightDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      lightFrequencyDays: freezed == lightFrequencyDays
          ? _self.lightFrequencyDays
          : lightFrequencyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      toxicity: freezed == toxicity
          ? _self.toxicity
          : toxicity // ignore: cast_nullable_to_non_nullable
              as ToxicityLevel?,
      toxicityDescription: freezed == toxicityDescription
          ? _self.toxicityDescription
          : toxicityDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
