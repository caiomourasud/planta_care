import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/firebase/auth.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    Auth.listenAuthState().onData((user) {
      if (user == null && mounted) {
        context.go('/login');
      } else if (user != null && mounted) {
        context.go('/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget.child,
    );
  }
}
