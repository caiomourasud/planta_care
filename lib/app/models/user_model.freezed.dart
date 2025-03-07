// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String? get uid;
  String? get name;
  DateTime? get birthDate;
  String? get email;
  String? get internationalAreaCode;
  String? get phone;
  String? get city;
  String? get state;
  String? get country;
  @PlantLocationOptionsConverter()
  PlantLocationOptions? get plantLocations;
  ExperienceLevel? get experienceLevel;
  String? get profilePhotoUrl;
  bool? get emailVerified;
  String? get timezone;
  AccountType? get accountType;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  String? get languagePreference;
  String? get units;
  String? get themePreference;
  bool? get onboardingSkipped;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.internationalAreaCode, internationalAreaCode) ||
                other.internationalAreaCode == internationalAreaCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality()
                .equals(other.plantLocations, plantLocations) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.themePreference, themePreference) ||
                other.themePreference == themePreference) &&
            (identical(other.onboardingSkipped, onboardingSkipped) ||
                other.onboardingSkipped == onboardingSkipped));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        name,
        birthDate,
        email,
        internationalAreaCode,
        phone,
        city,
        state,
        country,
        const DeepCollectionEquality().hash(plantLocations),
        experienceLevel,
        profilePhotoUrl,
        emailVerified,
        timezone,
        accountType,
        createdAt,
        updatedAt,
        languagePreference,
        units,
        themePreference,
        onboardingSkipped
      ]);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, birthDate: $birthDate, email: $email, internationalAreaCode: $internationalAreaCode, phone: $phone, city: $city, state: $state, country: $country, plantLocations: $plantLocations, experienceLevel: $experienceLevel, profilePhotoUrl: $profilePhotoUrl, emailVerified: $emailVerified, timezone: $timezone, accountType: $accountType, createdAt: $createdAt, updatedAt: $updatedAt, languagePreference: $languagePreference, units: $units, themePreference: $themePreference, onboardingSkipped: $onboardingSkipped)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String? uid,
      String? name,
      DateTime? birthDate,
      String? email,
      String? internationalAreaCode,
      String? phone,
      String? city,
      String? state,
      String? country,
      @PlantLocationOptionsConverter()
      Map<PlantLocationOption, bool>? plantLocations,
      ExperienceLevel? experienceLevel,
      String? profilePhotoUrl,
      bool? emailVerified,
      String? timezone,
      AccountType? accountType,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? languagePreference,
      String? units,
      String? themePreference,
      bool? onboardingSkipped});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? internationalAreaCode = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? plantLocations = freezed,
    Object? experienceLevel = freezed,
    Object? profilePhotoUrl = freezed,
    Object? emailVerified = freezed,
    Object? timezone = freezed,
    Object? accountType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? languagePreference = freezed,
    Object? units = freezed,
    Object? themePreference = freezed,
    Object? onboardingSkipped = freezed,
  }) {
    return _then(_self.copyWith(
      uid: freezed == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalAreaCode: freezed == internationalAreaCode
          ? _self.internationalAreaCode
          : internationalAreaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      plantLocations: freezed == plantLocations
          ? _self.plantLocations!
          : plantLocations // ignore: cast_nullable_to_non_nullable
              as Map<PlantLocationOption, bool>?,
      experienceLevel: freezed == experienceLevel
          ? _self.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _self.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languagePreference: freezed == languagePreference
          ? _self.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as String?,
      themePreference: freezed == themePreference
          ? _self.themePreference
          : themePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingSkipped: freezed == onboardingSkipped
          ? _self.onboardingSkipped
          : onboardingSkipped // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {this.uid,
      this.name,
      this.birthDate,
      this.email,
      this.internationalAreaCode,
      this.phone,
      this.city,
      this.state,
      this.country,
      @PlantLocationOptionsConverter()
      final Map<PlantLocationOption, bool>? plantLocations,
      this.experienceLevel,
      this.profilePhotoUrl,
      this.emailVerified = false,
      this.timezone,
      this.accountType,
      this.createdAt,
      this.updatedAt,
      this.languagePreference,
      this.units,
      this.themePreference,
      this.onboardingSkipped = false})
      : _plantLocations = plantLocations;
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final DateTime? birthDate;
  @override
  final String? email;
  @override
  final String? internationalAreaCode;
  @override
  final String? phone;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  final Map<PlantLocationOption, bool>? _plantLocations;
  @override
  @PlantLocationOptionsConverter()
  Map<PlantLocationOption, bool>? get plantLocations {
    final value = _plantLocations;
    if (value == null) return null;
    if (_plantLocations is EqualUnmodifiableMapView) return _plantLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final ExperienceLevel? experienceLevel;
  @override
  final String? profilePhotoUrl;
  @override
  @JsonKey()
  final bool? emailVerified;
  @override
  final String? timezone;
  @override
  final AccountType? accountType;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? languagePreference;
  @override
  final String? units;
  @override
  final String? themePreference;
  @override
  @JsonKey()
  final bool? onboardingSkipped;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.internationalAreaCode, internationalAreaCode) ||
                other.internationalAreaCode == internationalAreaCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality()
                .equals(other._plantLocations, _plantLocations) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference) &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.themePreference, themePreference) ||
                other.themePreference == themePreference) &&
            (identical(other.onboardingSkipped, onboardingSkipped) ||
                other.onboardingSkipped == onboardingSkipped));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        name,
        birthDate,
        email,
        internationalAreaCode,
        phone,
        city,
        state,
        country,
        const DeepCollectionEquality().hash(_plantLocations),
        experienceLevel,
        profilePhotoUrl,
        emailVerified,
        timezone,
        accountType,
        createdAt,
        updatedAt,
        languagePreference,
        units,
        themePreference,
        onboardingSkipped
      ]);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, birthDate: $birthDate, email: $email, internationalAreaCode: $internationalAreaCode, phone: $phone, city: $city, state: $state, country: $country, plantLocations: $plantLocations, experienceLevel: $experienceLevel, profilePhotoUrl: $profilePhotoUrl, emailVerified: $emailVerified, timezone: $timezone, accountType: $accountType, createdAt: $createdAt, updatedAt: $updatedAt, languagePreference: $languagePreference, units: $units, themePreference: $themePreference, onboardingSkipped: $onboardingSkipped)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? name,
      DateTime? birthDate,
      String? email,
      String? internationalAreaCode,
      String? phone,
      String? city,
      String? state,
      String? country,
      @PlantLocationOptionsConverter()
      Map<PlantLocationOption, bool>? plantLocations,
      ExperienceLevel? experienceLevel,
      String? profilePhotoUrl,
      bool? emailVerified,
      String? timezone,
      AccountType? accountType,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? languagePreference,
      String? units,
      String? themePreference,
      bool? onboardingSkipped});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? birthDate = freezed,
    Object? email = freezed,
    Object? internationalAreaCode = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? plantLocations = freezed,
    Object? experienceLevel = freezed,
    Object? profilePhotoUrl = freezed,
    Object? emailVerified = freezed,
    Object? timezone = freezed,
    Object? accountType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? languagePreference = freezed,
    Object? units = freezed,
    Object? themePreference = freezed,
    Object? onboardingSkipped = freezed,
  }) {
    return _then(_UserModel(
      uid: freezed == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      internationalAreaCode: freezed == internationalAreaCode
          ? _self.internationalAreaCode
          : internationalAreaCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      plantLocations: freezed == plantLocations
          ? _self._plantLocations
          : plantLocations // ignore: cast_nullable_to_non_nullable
              as Map<PlantLocationOption, bool>?,
      experienceLevel: freezed == experienceLevel
          ? _self.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel?,
      profilePhotoUrl: freezed == profilePhotoUrl
          ? _self.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _self.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languagePreference: freezed == languagePreference
          ? _self.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      units: freezed == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as String?,
      themePreference: freezed == themePreference
          ? _self.themePreference
          : themePreference // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingSkipped: freezed == onboardingSkipped
          ? _self.onboardingSkipped
          : onboardingSkipped // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
