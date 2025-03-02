import 'package:flutter/material.dart';

class ScaffoldElevatedContainer extends StatelessWidget {
  const ScaffoldElevatedContainer({
    this.height,
    super.key,
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
