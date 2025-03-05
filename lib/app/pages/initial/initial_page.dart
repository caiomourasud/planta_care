import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/pages/initial/components/planta_bottom_navigtion_bar.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          navigationShell,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PlantaBottomNavigationBar(
              onPressed: _goBranch,
              currentIndex: navigationShell.currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
