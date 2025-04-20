import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/popular_plant.dart';

class SquarePopularPlantCard extends StatefulWidget {
  const SquarePopularPlantCard({
    required this.plant,
    this.onTap,
    super.key,
  });

  final PopularPlant plant;
  final void Function()? onTap;

  @override
  State<SquarePopularPlantCard> createState() => _SquarePopularPlantCardState();
}

class _SquarePopularPlantCardState extends State<SquarePopularPlantCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 1.0,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.plant.localUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 54.0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.plant.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.plant.category.title,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(120),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.primary,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
