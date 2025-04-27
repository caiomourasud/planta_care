import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planta_care/app/components/tint_widget_by_level.dart';
import 'package:planta_care/app/enums/toxicity_level.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/pages/plant_details/components/plant_care_section_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlantCareSection extends StatelessWidget {
  const PlantCareSection({
    required this.myPlant,
    super.key,
  });

  final MyPlantModel? myPlant;

  Widget _wateringDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${myPlant?.plantCare?.wateringDescription}',
        ),
        const SizedBox(height: 16.0),
        Text(
          'Watering Frequency:',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4.0),
        RichText(
          text: TextSpan(
            text: 'Watering should be done every ',
            style: Theme.of(context).textTheme.bodyMedium,
            children: <TextSpan>[
              TextSpan(
                text: '${myPlant?.plantCare?.wateringFrequencyDays} days.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Watering Moisture Threshold:',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4.0),
        RichText(
          text: TextSpan(
            text:
                'The next watering should occur when the soil moisture reaches ',
            style: Theme.of(context).textTheme.bodyMedium,
            children: <TextSpan>[
              TextSpan(
                text: '${myPlant?.plantCare?.wateringMoistureThreshold}%',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: '.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildCare({
      Widget? icon,
      String? title,
      String? careTitle,
      String? description,
      Color? color,
      double? level,
      void Function()? onTap,
    }) {
      return AspectRatio(
        aspectRatio: 1.0,
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            minVerticalPadding: 0,
            minTileHeight: 0,
            minLeadingWidth: 0,
            onTap: () {
              PlantCareSectionBottomSheet.show(
                context,
                icon: icon,
                title: title,
                careTitle: careTitle,
                description: title == 'Watering'
                    ? _wateringDescription(context)
                    : Text(
                        description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                color: color,
                level: level,
              );
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            tileColor: Theme.of(context).colorScheme.surface,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                const SizedBox(height: 4.0),
                Text(
                  careTitle ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Skeleton.keep(
          child: Text(
            'Plant Care',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 8.0),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            shrinkWrap: true,
            children: [
              buildCare(
                icon: SvgPicture.asset(
                  'assets/svg/icons/my_place.svg',
                  width: 20.0,
                  height: 20.0,
                  colorFilter: ColorFilter.mode(
                    myPlant?.plantCare?.maintenanceDifficulty?.color ??
                        Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                careTitle: myPlant?.plantCare?.maintenanceDifficulty?.title,
                title: 'Maintenance',
                description: myPlant?.plantCare?.maintenanceDescription,
              ),
              buildCare(
                icon: TintWidgetByLevel(
                  level: myPlant?.plantCare?.wateringNeeds?.level ?? 0.5,
                  color: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.water_drop,
                    color: Colors.grey[400],
                  ),
                ),
                careTitle: myPlant?.plantCare?.wateringNeeds?.title,
                title: 'Watering',
                description: myPlant?.plantCare?.wateringDescription,
              ),
              buildCare(
                icon: TintWidgetByLevel(
                  level: myPlant?.plantCare?.lightNeeds?.level ?? 0.5,
                  color: Colors.orangeAccent,
                  child: Icon(
                    Icons.sunny,
                    color: Colors.grey[400],
                  ),
                ),
                careTitle: myPlant?.plantCare?.lightNeeds?.title,
                title: 'Light',
                description: myPlant?.plantCare?.lightDescription,
              ),
              if (myPlant?.plantCare?.toxicity == ToxicityLevel.toxic)
                buildCare(
                  icon: const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                  ),
                  careTitle: myPlant?.plantCare?.toxicity?.title,
                  title: 'Toxicity',
                  description: myPlant?.plantCare?.toxicityDescription,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
