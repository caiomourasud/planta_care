import 'package:flutter/material.dart';

class MyPlantsVerticalList<T> extends StatelessWidget {
  const MyPlantsVerticalList({
    required this.title,
    required this.items,
    required this.itemBuilder,
    this.onViewAllPressed,
    super.key,
  });

  final String title;
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final VoidCallback? onViewAllPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (onViewAllPressed != null)
                FilledButton(
                  style: FilledButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: onViewAllPressed,
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              else
                const SizedBox(height: 40.0),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              items.length,
              (index) => itemBuilder(items[index], index),
            ),
          ),
        ),
      ],
    );
  }
}
