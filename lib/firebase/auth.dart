import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/components/planta_snack_bar.dart';

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User? get currentUser => _firebaseAuth.currentUser;

  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  static Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context != null) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.message ?? 'An unknown error occurred',
          type: PlantaSnackBarType.error,
        );
      }
      return null;
    } catch (e) {
      if (context != null) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.toString(),
          type: PlantaSnackBarType.error,
        );
      }
      return null;
    }
  }

  static Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: 'User created successfully',
          type: PlantaSnackBarType.success,
        );
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.toString(),
          type: PlantaSnackBarType.error,
        );
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.toString(),
          type: PlantaSnackBarType.error,
        );
      }
      return null;
    }
  }

  static Future<void> sendPasswordResetEmail({
    required String email,
    BuildContext? context,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.message ?? 'An unknown error occurred',
          type: PlantaSnackBarType.error,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.toString(),
          type: PlantaSnackBarType.error,
        );
      }
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

  static Future<void> signOut({
    BuildContext? context,
  }) async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.message ?? 'An unknown error occurred',
          type: PlantaSnackBarType.error,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.toString(),
          type: PlantaSnackBarType.error,
        );
      }
    }
  }

  static Future<UserCredential?> changePassword(
    String oldPassword,
    String newPassword,
    BuildContext? context,
  ) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: currentUser?.email ?? '',
        password: oldPassword,
      );
      return currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (context != null && context.mounted) {
        PlantaSnackBar.showSnackBar(
          context: context,
          message: e.message ?? 'An unknown error occurred',
          type: PlantaSnackBarType.error,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  static StreamSubscription<User?> listenAuthState() {
    return _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }
}
