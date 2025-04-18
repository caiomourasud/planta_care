import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/popular_plant.dart';

class HorizontalPopularPlantCard extends StatefulWidget {
  const HorizontalPopularPlantCard({
    required this.plant,
    super.key,
    this.onTap,
  });

  final PopularPlant plant;
  final void Function()? onTap;

  @override
  State<HorizontalPopularPlantCard> createState() =>
      _HorizontalPopularPlantCardState();
}

class _HorizontalPopularPlantCardState
    extends State<HorizontalPopularPlantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 60.0,
              width: 60.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.plant.localUrl,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.plant.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.plant.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            IgnorePointer(
              ignoring: true,
              child: IconButton(
                style: IconButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  shape: const CircleBorder(),
                ),
                onPressed: widget.onTap,
                icon: Container(
                  height: 38.0,
                  width: 28.0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
