// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceModel {
  String get id;
  List<DeviceReadingModel>? get readings;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.readings, readings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(readings));

  @override
  String toString() {
    return 'DeviceModel(id: $id, readings: $readings)';
  }
}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) _then) =
      _$DeviceModelCopyWithImpl;
  @useResult
  $Res call({String id, List<DeviceReadingModel>? readings});
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res> implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readings = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readings: freezed == readings
          ? _self.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<DeviceReadingModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceModel implements DeviceModel {
  const _DeviceModel(
      {required this.id, final List<DeviceReadingModel>? readings})
      : _readings = readings;
  factory _DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  @override
  final String id;
  final List<DeviceReadingModel>? _readings;
  @override
  List<DeviceReadingModel>? get readings {
    final value = _readings;
    if (value == null) return null;
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceModelCopyWith<_DeviceModel> get copyWith =>
      __$DeviceModelCopyWithImpl<_DeviceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._readings, _readings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_readings));

  @override
  String toString() {
    return 'DeviceModel(id: $id, readings: $readings)';
  }
}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(
          _DeviceModel value, $Res Function(_DeviceModel) _then) =
      __$DeviceModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, List<DeviceReadingModel>? readings});
}

/// @nodoc
class __$DeviceModelCopyWithImpl<$Res> implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

  /// Create a copy of DeviceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? readings = freezed,
  }) {
    return _then(_DeviceModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readings: freezed == readings
          ? _self._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<DeviceReadingModel>?,
    ));
  }
}

// dart format on
