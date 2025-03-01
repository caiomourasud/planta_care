import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User? get currentUser => _firebaseAuth.currentUser;

  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  static Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<bool> deleteUser({
  //   required IVUSAIDUser? ivusaidUser,
  //   required String password,
  // }) async {
  //   try {
  //     User? user = _firebaseAuth.currentUser;
  //     AuthCredential credentials = EmailAuthProvider.credential(
  //       email: ivusaidUser?.email ?? '',
  //       password: password,
  //     );
  //     UserCredential? result =
  //         await user?.reauthenticateWithCredential(credentials);
  //     if (result == null) return false;
  //     await UserCollection().deleteUser(ivusaidUser: ivusaidUser);
  //     await result.user?.delete();
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<UserCredential?> changePassword(
    String oldPassword,
    String newPassword,
  ) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: currentUser?.email ?? '',
        password: oldPassword,
      );
      return currentUser?.reauthenticateWithCredential(credential);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
