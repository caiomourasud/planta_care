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
  List<DeviceReadingModel>? get readings;
  @LightLevelConverter()
  double? get light;
  double? get moisture;
  DateTime? get timestamp;
  double? get temperature;
  double? get humidity;
  bool? get realTimeEnabled;

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
            const DeepCollectionEquality().equals(other.readings, readings) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.realTimeEnabled, realTimeEnabled) ||
                other.realTimeEnabled == realTimeEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(readings),
      light,
      moisture,
      timestamp,
      temperature,
      humidity,
      realTimeEnabled);

  @override
  String toString() {
    return 'DeviceModel(readings: $readings, light: $light, moisture: $moisture, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, realTimeEnabled: $realTimeEnabled)';
  }
}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) _then) =
      _$DeviceModelCopyWithImpl;
  @useResult
  $Res call(
      {List<DeviceReadingModel>? readings,
      @LightLevelConverter() double? light,
      double? moisture,
      DateTime? timestamp,
      double? temperature,
      double? humidity,
      bool? realTimeEnabled});
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
    Object? readings = freezed,
    Object? light = freezed,
    Object? moisture = freezed,
    Object? timestamp = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? realTimeEnabled = freezed,
  }) {
    return _then(_self.copyWith(
      readings: freezed == readings
          ? _self.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<DeviceReadingModel>?,
      light: freezed == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as double?,
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
      realTimeEnabled: freezed == realTimeEnabled
          ? _self.realTimeEnabled
          : realTimeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceModel extends DeviceModel {
  const _DeviceModel(
      {final List<DeviceReadingModel>? readings,
      @LightLevelConverter() this.light,
      this.moisture,
      this.timestamp,
      this.temperature,
      this.humidity,
      this.realTimeEnabled})
      : _readings = readings,
        super._();
  factory _DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  final List<DeviceReadingModel>? _readings;
  @override
  List<DeviceReadingModel>? get readings {
    final value = _readings;
    if (value == null) return null;
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @LightLevelConverter()
  final double? light;
  @override
  final double? moisture;
  @override
  final DateTime? timestamp;
  @override
  final double? temperature;
  @override
  final double? humidity;
  @override
  final bool? realTimeEnabled;

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
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.realTimeEnabled, realTimeEnabled) ||
                other.realTimeEnabled == realTimeEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_readings),
      light,
      moisture,
      timestamp,
      temperature,
      humidity,
      realTimeEnabled);

  @override
  String toString() {
    return 'DeviceModel(readings: $readings, light: $light, moisture: $moisture, timestamp: $timestamp, temperature: $temperature, humidity: $humidity, realTimeEnabled: $realTimeEnabled)';
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
  $Res call(
      {List<DeviceReadingModel>? readings,
      @LightLevelConverter() double? light,
      double? moisture,
      DateTime? timestamp,
      double? temperature,
      double? humidity,
      bool? realTimeEnabled});
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
    Object? readings = freezed,
    Object? light = freezed,
    Object? moisture = freezed,
    Object? timestamp = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? realTimeEnabled = freezed,
  }) {
    return _then(_DeviceModel(
      readings: freezed == readings
          ? _self._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<DeviceReadingModel>?,
      light: freezed == light
          ? _self.light
          : light // ignore: cast_nullable_to_non_nullable
              as double?,
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
      realTimeEnabled: freezed == realTimeEnabled
          ? _self.realTimeEnabled
          : realTimeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
