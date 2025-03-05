import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGuard {
  const AuthGuard();
  String? isNotLogged(BuildContext context, GoRouterState state) {
    final firebaseAuth = FirebaseAuth.instance;
    final isLogged = firebaseAuth.currentUser != null;
    final value = isLogged ? null : '/';
    return value;
  }

  String? isLogged(BuildContext context, GoRouterState state) {
    final firebaseAuth = FirebaseAuth.instance;
    final isLogged = firebaseAuth.currentUser != null;
    final value = isLogged ? '/home' : null;
    return value;
  }
}
