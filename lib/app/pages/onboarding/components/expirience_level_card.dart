import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/experience_level.dart';

class ExperienceLevelCard extends StatelessWidget {
  final ExperienceLevel experienceLevel;
  final bool isSelected;
  final void Function(ExperienceLevel) onSelected;

  const ExperienceLevelCard({
    required this.experienceLevel,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Material(
          child: ListTile(
            onTap: () => onSelected(experienceLevel),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
              ),
            ),
            tileColor: Theme.of(context).scaffoldBackgroundColor,
            title: Padding(
              padding: const EdgeInsets.only(
                left: 80.0,
                top: 8.0,
                bottom: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    experienceLevel.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    experienceLevel.description,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Image.asset(
            'assets/images/experience_level/${experienceLevel.name}.png',
            width: 110,
            height: 110,
          ),
        ),
      ],
    );
  }
}
