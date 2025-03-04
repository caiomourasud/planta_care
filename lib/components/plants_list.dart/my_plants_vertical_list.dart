import 'package:flutter/material.dart';

class MyPlantsVerticalList<T> extends StatelessWidget {
  const MyPlantsVerticalList({
    required this.title,
    required this.onViewAllPressed,
    required this.items,
    required this.itemBuilder,
    super.key,
  });

  final String title;
  final VoidCallback onViewAllPressed;
  final List<T> items;
  final Widget Function(T item) itemBuilder;

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
              ),
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
              (index) => itemBuilder(items[index]),
            ),
          ),
        ),
      ],
    );
  }
}
