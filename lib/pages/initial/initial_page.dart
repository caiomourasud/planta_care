import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/pages/initial/components/planta_bottom_navigtion_bar.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(index);
  }

  @override
  void initState() {
    Auth.listenAuthState().onData((user) {
      if (user == null && mounted) {
        context.go('/');
      } else if (user != null && mounted) {
        context.go('/home');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.navigationShell,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PlantaBottomNavigationBar(
              onPressed: _goBranch,
              currentIndex: widget.navigationShell.currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
