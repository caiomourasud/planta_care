import 'package:flutter/material.dart';
import 'package:planta_care/app/components/lists/horizontal_list.dart';

class MyPlantsHorizontalList<T> extends StatelessWidget {
  const MyPlantsHorizontalList({
    required this.title,
    required this.onViewAllPressed,
    required this.itemBuilder,
    this.minCardWidth,
    this.aspectRatioItem,
    this.items = const [],
    super.key,
  });

  final String title;
  final VoidCallback onViewAllPressed;
  final Widget Function(T object, double height) itemBuilder;
  final double? minCardWidth;
  final double? aspectRatioItem;
  final List<T> items;

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
        AdaptativeHorizontalList<T>(
          aspectRatio: aspectRatioItem ?? 1,
          minCardWidth: minCardWidth ?? 200,
          numberOfRows: 1,
          screenWidth: MediaQuery.sizeOf(context).width,
          items: items,
          itemBuilder: itemBuilder,
        ),
      ],
    );
  }
}
