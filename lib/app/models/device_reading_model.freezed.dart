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
// String? light,
  double? get moisture;
  DateTime? get timestamp;
  double? get temperature;
  double? get humidity;

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
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, moisture, timestamp, temperature, humidity);

  @override
  String toString() {
    return 'DeviceReadingModel(moisture: $moisture, timestamp: $timestamp, temperature: $temperature, humidity: $humidity)';
  }
}

/// @nodoc
abstract mixin class $DeviceReadingModelCopyWith<$Res> {
  factory $DeviceReadingModelCopyWith(
          DeviceReadingModel value, $Res Function(DeviceReadingModel) _then) =
      _$DeviceReadingModelCopyWithImpl;
  @useResult
  $Res call(
      {double? moisture,
      DateTime? timestamp,
      double? temperature,
      double? humidity});
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
    Object? moisture = freezed,
    Object? timestamp = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_self.copyWith(
      moisture: freezed == moisture
          ? _self.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: freezed == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceReadingModel implements DeviceReadingModel {
  const _DeviceReadingModel(
      {this.moisture, this.timestamp, this.temperature, this.humidity});
  factory _DeviceReadingModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceReadingModelFromJson(json);

// String? light,
  @override
  final double? moisture;
  @override
  final DateTime? timestamp;
  @override
  final double? temperature;
  @override
  final double? humidity;

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
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, moisture, timestamp, temperature, humidity);

  @override
  String toString() {
    return 'DeviceReadingModel(moisture: $moisture, timestamp: $timestamp, temperature: $temperature, humidity: $humidity)';
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
  $Res call(
      {double? moisture,
      DateTime? timestamp,
      double? temperature,
      double? humidity});
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
    Object? moisture = freezed,
    Object? timestamp = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_DeviceReadingModel(
      moisture: freezed == moisture
          ? _self.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: freezed == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
