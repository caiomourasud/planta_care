// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      email: json['email'] as String?,
      internationalAreaCode: json['internationalAreaCode'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      plantLocations: const PlantLocationOptionsConverter()
          .fromJson(json['plantLocations'] as Map<String, dynamic>?),
      experienceLevel: $enumDecodeNullable(
          _$ExperienceLevelEnumMap, json['experienceLevel']),
      profilePhotoUrl: json['profilePhotoUrl'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
      timezone: json['timezone'] as String?,
      accountType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      languagePreference: json['languagePreference'] as String?,
      units: json['units'] as String?,
      themePreference: json['themePreference'] as String?,
      onboardingSkipped: json['onboardingSkipped'] as bool? ?? false,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'email': instance.email,
      'internationalAreaCode': instance.internationalAreaCode,
      'phone': instance.phone,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'plantLocations':
          const PlantLocationOptionsConverter().toJson(instance.plantLocations),
      'experienceLevel': _$ExperienceLevelEnumMap[instance.experienceLevel],
      'profilePhotoUrl': instance.profilePhotoUrl,
      'emailVerified': instance.emailVerified,
      'timezone': instance.timezone,
      'accountType': _$AccountTypeEnumMap[instance.accountType],
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'languagePreference': instance.languagePreference,
      'units': instance.units,
      'themePreference': instance.themePreference,
      'onboardingSkipped': instance.onboardingSkipped,
    };

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.hopeless: 'hopeless',
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.experienced: 'experienced',
};

const _$AccountTypeEnumMap = {
  AccountType.free: 'free',
  AccountType.premium: 'premium',
};
