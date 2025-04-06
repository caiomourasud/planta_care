import 'package:flutter/material.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/services/color_service.dart';

class MyPlantHorizontalCard extends StatefulWidget {
  const MyPlantHorizontalCard({
    required this.plant,
    this.onTap,
    super.key,
  });

  final MyPlantModel plant;
  final void Function()? onTap;

  @override
  State<MyPlantHorizontalCard> createState() => _MyPlantHorizontalCardState();
}

class _MyPlantHorizontalCardState extends State<MyPlantHorizontalCard> {
  Color? _averageColor;

  String get _imagePath =>
      widget.plant.localUrl ??
      widget.plant.category?.localUrl ??
      'assets/images/where_are_your_plants.png';

  @override
  void initState() {
    super.initState();
    _getAverageColor();
  }

  Future<void> _getAverageColor() async {
    final averageColor = await ColorService.getAverageColor(
      widget.plant.localUrl ??
          widget.plant.category?.localUrl ??
          'assets/images/where_are_your_plants.png',
    );
    setState(() {
      _averageColor = averageColor;
    });
  }

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
                color:
                    _averageColor ?? Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 60.0,
              width: 60.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  _imagePath,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.plant.name ?? 'Plant',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.plant.category?.title ??
                        widget.plant.description ??
                        'Plant',
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
            SizedBox(
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
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
