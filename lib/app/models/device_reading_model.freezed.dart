// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_reading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceReadingModel {
  String? get light;
  int? get moisture;
  DateTime? get timestamp;

  /// Create a copy of DeviceReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceReadingModelCopyWith<DeviceReadingModel> get copyWith =>
      _$DeviceReadingModelCopyWithImpl<DeviceReadingModel>(
          this as DeviceReadingModel, _$identity);

  /// Serializes this DeviceReadingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceReadingModel &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, light, moisture, timestamp);

  @override
  String toString() {
    return 'DeviceReadingModel(light: $light, moisture: $moisture, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $DeviceReadingModelCopyWith<$Res> {
  factory $DeviceReadingModelCopyWith(
          DeviceReadingModel value, $Res Function(DeviceReadingModel) _then) =
      _$DeviceReadingModelCopyWithImpl;
  @useResult
  $Res call({String? light, int? moisture, DateTime? timestamp});
}

/// @nodoc
class _$DeviceReadingModelCopyWithImpl<$Res>
    implements $DeviceReadingModelCopyWith<$Res> {
  _$DeviceReadingModelCopyWithImpl(this._self, this._then);

  final DeviceReadingModel _self;
  final $Res Function(DeviceReadingModel) _then;

  /// Create a copy of DeviceReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = freezed,
    Object? moisture = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      light: freezed == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as String?,
      moisture: freezed == moisture
          ? _self.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceReadingModel implements DeviceReadingModel {
  const _DeviceReadingModel({this.light, this.moisture, this.timestamp});
  factory _DeviceReadingModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceReadingModelFromJson(json);

  @override
  final String? light;
  @override
  final int? moisture;
  @override
  final DateTime? timestamp;

  /// Create a copy of DeviceReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceReadingModelCopyWith<_DeviceReadingModel> get copyWith =>
      __$DeviceReadingModelCopyWithImpl<_DeviceReadingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceReadingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceReadingModel &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, light, moisture, timestamp);

  @override
  String toString() {
    return 'DeviceReadingModel(light: $light, moisture: $moisture, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$DeviceReadingModelCopyWith<$Res>
    implements $DeviceReadingModelCopyWith<$Res> {
  factory _$DeviceReadingModelCopyWith(
          _DeviceReadingModel value, $Res Function(_DeviceReadingModel) _then) =
      __$DeviceReadingModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? light, int? moisture, DateTime? timestamp});
}

/// @nodoc
class __$DeviceReadingModelCopyWithImpl<$Res>
    implements _$DeviceReadingModelCopyWith<$Res> {
  __$DeviceReadingModelCopyWithImpl(this._self, this._then);

  final _DeviceReadingModel _self;
  final $Res Function(_DeviceReadingModel) _then;

  /// Create a copy of DeviceReadingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? light = freezed,
    Object? moisture = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_DeviceReadingModel(
      light: freezed == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as String?,
      moisture: freezed == moisture
          ? _self.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
