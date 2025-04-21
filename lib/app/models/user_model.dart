import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/converters/plant_location_options_converter.dart';
import 'package:planta_care/app/enums/account_type.dart';
import 'package:planta_care/app/enums/experience_level.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

typedef PlantLocationOptions = Map<PlantLocationOption, bool>;

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? uid,
    String? name,
    String? profession,
    DateTime? birthDate,
    String? email,
    String? internationalAreaCode,
    String? phone,
    String? city,
    String? state,
    String? country,
    @PlantLocationOptionsConverter() PlantLocationOptions? plantLocations,
    ExperienceLevel? experienceLevel,
    String? profilePhotoUrl,
    @Default(false) bool? emailVerified,
    String? timezone,
    AccountType? accountType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? languagePreference,
    String? units,
    String? themePreference,
    @Default(false) bool? onboardingSkipped,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
