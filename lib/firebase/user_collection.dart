import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
