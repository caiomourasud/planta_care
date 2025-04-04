import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/experience_level.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';
import 'package:planta_care/app/models/user_model.dart';

class UserCollection {
  static CollectionReference<Map<String, dynamic>> _usersCollection() {
    return FirebaseFirestore.instance.collection('users');
  }

  static DocumentReference<Map<String, dynamic>>? _userDoc(String? userEmail) {
    if (userEmail == null) {
      debugPrint('User email is null');
      return null;
    }
    return _usersCollection().doc(userEmail);
  }

  static Future<bool> createUser(User? user) async {
    if (user == null) {
      debugPrint('User is null');
      return false;
    }
    try {
      await _userDoc(user.email)?.set(
        UserModel(
          uid: user.email,
          email: user.email,
          createdAt: DateTime.now(),
        ).toJson(),
      );
      return true;
    } catch (e) {
      debugPrint('Failed Creating User => $e');
    }
    return false;
  }

  static Future<bool> updateUser(UserModel user) async {
    try {
      await _userDoc(user.email)?.set(
        user.copyWith(updatedAt: DateTime.now()).toJson(),
        SetOptions(merge: true),
      );
      return true;
    } catch (e) {
      debugPrint('Failed Updating User => $e');
    }
    return false;
  }

  static Future<bool> updateUserPlantsLocation(
    String? userId,
    Map<PlantLocationOption, bool> plantsLocation,
  ) async {
    if (userId == null) {
      debugPrint('User ID is null');
      return false;
    }
    try {
      await _userDoc(userId)?.update({
        'plantLocations':
            plantsLocation.map((key, value) => MapEntry(key.name, value)),
      });
      return true;
    } catch (e) {
      debugPrint('Failed Updating User Plants Location => $e');
    }
    return false;
  }

  static Future<bool> updateUserExperienceLevel(
    String? userId,
    ExperienceLevel experienceLevel,
  ) async {
    if (userId == null) {
      debugPrint('User ID is null');
      return false;
    }
    try {
      await _userDoc(userId)?.update({
        'experienceLevel': experienceLevel.name,
      });
      return true;
    } catch (e) {
      debugPrint('Failed Updating User Experience Level => $e');
    }
    return false;
  }

  static Future<bool> updateUserOnboardingSkipped(
    String? userId,
    bool onboardingSkipped,
  ) async {
    if (userId == null) {
      debugPrint('User ID is null');
      return false;
    }
    try {
      await _userDoc(userId)?.update({
        'onboardingSkipped': onboardingSkipped,
      });
      return true;
    } catch (e) {
      debugPrint('Failed Updating User Onboarding Skipped => $e');
    }
    return false;
  }

  static Future<UserModel?> getUserById(String? userId) async {
    if (userId == null) {
      debugPrint('User ID is null');
      return null;
    }
    return _userDoc(userId)
        ?.get()
        .then((value) => UserModel.fromJson(value.data() ?? {}));
  }
}
