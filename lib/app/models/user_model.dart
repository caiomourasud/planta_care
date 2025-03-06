import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/account_type.dart';
import 'package:planta_care/app/enums/experience_level.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? uid,
    String? name,
    DateTime? birthDate,
    String? email,
    String? internationalAreaCode,
    String? phone,
    String? city,
    String? state,
    String? country,
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
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
