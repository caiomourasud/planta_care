import 'package:flutter/material.dart';
import 'package:planta_care/components/lists/horizontal_list.dart';

class MyPlantsHorizontalList extends StatelessWidget {
  const MyPlantsHorizontalList({super.key});

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
                  'My Plants',
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
                onPressed: () {},
                child: const Text('View all'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        AdaptativeHorizontalList<String>(
          aspectRatio: 1,
          minCardWidth: 200,
          numberOfRows: 2,
          screenWidth: MediaQuery.of(context).size.width,
          items: const [
            'Plant 1',
            'Plant 2',
            'Plant 3',
            'Plant 4',
            'Plant 5',
            'Plant 6',
            'Plant 7',
            'Plant 8',
            'Plant 9',
          ],
          item: (item, height) {
            return Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              child: Center(child: Text(item)),
            );
          },
        ),
      ],
    );
  }
}
