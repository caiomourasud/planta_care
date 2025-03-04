import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlantaSlidingSegmentedControl<T extends Object> extends StatelessWidget {
  const PlantaSlidingSegmentedControl({
    required this.groupValue,
    required this.onValueChanged,
    this.children = const [],
    required this.itemBuilder,
    super.key,
  });

  final T groupValue;
  final Function(T?) onValueChanged;
  final List<T> children;
  final Widget Function(T, bool) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<T>(
      backgroundColor: Theme.of(context).colorScheme.surface,
      thumbColor: Theme.of(context).colorScheme.primary,
      groupValue: groupValue,
      onValueChanged: onValueChanged,
      children: {
        for (var item in children)
          item: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Builder(builder: (context) {
              return itemBuilder(item, groupValue == item);
            }),
          ),
      },
    );
  }
}
