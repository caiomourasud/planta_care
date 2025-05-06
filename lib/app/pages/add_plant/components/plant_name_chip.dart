import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/popular_plant.dart';

class PlantNameChip extends StatelessWidget {
  const PlantNameChip({
    required this.plant,
    this.selectedPlant,
    required this.onSelected,
    super.key,
  });

  final PopularPlant? plant;
  final PopularPlant? selectedPlant;
  final void Function(PopularPlant? plant)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        plant?.title ?? '',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: selectedPlant == plant
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
      ),
      selected: false,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: selectedPlant == plant
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface.withAlpha(20),
        ),
        borderRadius: BorderRadius.circular(60.0),
      ),
      onSelected: (selected) {
        onSelected?.call(plant);
      },
    );
  }
}
