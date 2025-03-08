import 'package:flutter/material.dart';

class ScaffoldElevatedContainer extends StatelessWidget {
  const ScaffoldElevatedContainer({
    this.height,
    this.child,
    super.key,
  });
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(10),
            blurRadius: 16.0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
