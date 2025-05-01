// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantActivity {
  String? get id;
  String? get title;
  String? get image;
  PlantActivityType? get actionType;
  DateTime? get actionDate;
  DateTime? get createdAt;
  String? get notes;

  /// Create a copy of PlantActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlantActivityCopyWith<PlantActivity> get copyWith =>
      _$PlantActivityCopyWithImpl<PlantActivity>(
          this as PlantActivity, _$identity);

  /// Serializes this PlantActivity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlantActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.actionDate, actionDate) ||
                other.actionDate == actionDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, image, actionType, actionDate, createdAt, notes);

  @override
  String toString() {
    return 'PlantActivity(id: $id, title: $title, image: $image, actionType: $actionType, actionDate: $actionDate, createdAt: $createdAt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class $PlantActivityCopyWith<$Res> {
  factory $PlantActivityCopyWith(
          PlantActivity value, $Res Function(PlantActivity) _then) =
      _$PlantActivityCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? image,
      PlantActivityType? actionType,
      DateTime? actionDate,
      DateTime? createdAt,
      String? notes});
}

/// @nodoc
class _$PlantActivityCopyWithImpl<$Res>
    implements $PlantActivityCopyWith<$Res> {
  _$PlantActivityCopyWithImpl(this._self, this._then);

  final PlantActivity _self;
  final $Res Function(PlantActivity) _then;

  /// Create a copy of PlantActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? actionType = freezed,
    Object? actionDate = freezed,
    Object? createdAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: freezed == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as PlantActivityType?,
      actionDate: freezed == actionDate
          ? _self.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlantActivity implements PlantActivity {
  const _PlantActivity(
      {this.id,
      this.title,
      this.image,
      this.actionType,
      this.actionDate,
      this.createdAt,
      this.notes});
  factory _PlantActivity.fromJson(Map<String, dynamic> json) =>
      _$PlantActivityFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final PlantActivityType? actionType;
  @override
  final DateTime? actionDate;
  @override
  final DateTime? createdAt;
  @override
  final String? notes;

  /// Create a copy of PlantActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlantActivityCopyWith<_PlantActivity> get copyWith =>
      __$PlantActivityCopyWithImpl<_PlantActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlantActivityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlantActivity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.actionDate, actionDate) ||
                other.actionDate == actionDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, image, actionType, actionDate, createdAt, notes);

  @override
  String toString() {
    return 'PlantActivity(id: $id, title: $title, image: $image, actionType: $actionType, actionDate: $actionDate, createdAt: $createdAt, notes: $notes)';
  }
}

/// @nodoc
abstract mixin class _$PlantActivityCopyWith<$Res>
    implements $PlantActivityCopyWith<$Res> {
  factory _$PlantActivityCopyWith(
          _PlantActivity value, $Res Function(_PlantActivity) _then) =
      __$PlantActivityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? image,
      PlantActivityType? actionType,
      DateTime? actionDate,
      DateTime? createdAt,
      String? notes});
}

/// @nodoc
class __$PlantActivityCopyWithImpl<$Res>
    implements _$PlantActivityCopyWith<$Res> {
  __$PlantActivityCopyWithImpl(this._self, this._then);

  final _PlantActivity _self;
  final $Res Function(_PlantActivity) _then;

  /// Create a copy of PlantActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? actionType = freezed,
    Object? actionDate = freezed,
    Object? createdAt = freezed,
    Object? notes = freezed,
  }) {
    return _then(_PlantActivity(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      actionType: freezed == actionType
          ? _self.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as PlantActivityType?,
      actionDate: freezed == actionDate
          ? _self.actionDate
          : actionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
