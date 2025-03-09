// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_sub_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantSubLocationModel {
  String? get id;
  String? get name;
  String? get description;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  PlantLocationType? get plantLocationType;

  /// Create a copy of PlantSubLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantSubLocationModelCopyWith<PlantSubLocationModel> get copyWith =>
      _$PlantSubLocationModelCopyWithImpl<PlantSubLocationModel>(
          this as PlantSubLocationModel, _$identity);

  /// Serializes this PlantSubLocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantSubLocationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.plantLocationType, plantLocationType) ||
                other.plantLocationType == plantLocationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, createdAt,
      updatedAt, plantLocationType);

  @override
  String toString() {
    return 'PlantSubLocationModel(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, plantLocationType: $plantLocationType)';
  }
}

/// @nodoc
abstract mixin class $PlantSubLocationModelCopyWith<$Res> {
  factory $PlantSubLocationModelCopyWith(PlantSubLocationModel value,
          $Res Function(PlantSubLocationModel) _then) =
      _$PlantSubLocationModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      PlantLocationType? plantLocationType});
}

/// @nodoc
class _$PlantSubLocationModelCopyWithImpl<$Res>
    implements $PlantSubLocationModelCopyWith<$Res> {
  _$PlantSubLocationModelCopyWithImpl(this._self, this._then);

  final PlantSubLocationModel _self;
  final $Res Function(PlantSubLocationModel) _then;

  /// Create a copy of PlantSubLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? plantLocationType = freezed,
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
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      plantLocationType: freezed == plantLocationType
          ? _self.plantLocationType
          : plantLocationType // ignore: cast_nullable_to_non_nullable
              as PlantLocationType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlantSubLocationModel implements PlantSubLocationModel {
  const _PlantSubLocationModel(
      {this.id,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.plantLocationType});
  factory _PlantSubLocationModel.fromJson(Map<String, dynamic> json) =>
      _$PlantSubLocationModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final PlantLocationType? plantLocationType;

  /// Create a copy of PlantSubLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantSubLocationModelCopyWith<_PlantSubLocationModel> get copyWith =>
      __$PlantSubLocationModelCopyWithImpl<_PlantSubLocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantSubLocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantSubLocationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.plantLocationType, plantLocationType) ||
                other.plantLocationType == plantLocationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, createdAt,
      updatedAt, plantLocationType);

  @override
  String toString() {
    return 'PlantSubLocationModel(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, plantLocationType: $plantLocationType)';
  }
}

/// @nodoc
abstract mixin class _$PlantSubLocationModelCopyWith<$Res>
    implements $PlantSubLocationModelCopyWith<$Res> {
  factory _$PlantSubLocationModelCopyWith(_PlantSubLocationModel value,
          $Res Function(_PlantSubLocationModel) _then) =
      __$PlantSubLocationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      DateTime? createdAt,
      DateTime? updatedAt,
      PlantLocationType? plantLocationType});
}

/// @nodoc
class __$PlantSubLocationModelCopyWithImpl<$Res>
    implements _$PlantSubLocationModelCopyWith<$Res> {
  __$PlantSubLocationModelCopyWithImpl(this._self, this._then);

  final _PlantSubLocationModel _self;
  final $Res Function(_PlantSubLocationModel) _then;

  /// Create a copy of PlantSubLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? plantLocationType = freezed,
  }) {
    return _then(_PlantSubLocationModel(
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
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      plantLocationType: freezed == plantLocationType
          ? _self.plantLocationType
          : plantLocationType // ignore: cast_nullable_to_non_nullable
              as PlantLocationType?,
    ));
  }
}

// dart format on
