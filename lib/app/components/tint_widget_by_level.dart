import 'package:flutter/material.dart';

class TintWidgetByLevel extends StatelessWidget {
  const TintWidgetByLevel({
    required this.level,
    required this.color,
    required this.child,
    super.key,
  });

  final double level;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[color, Colors.transparent],
            stops: [level, level],
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: child);
  }
}
