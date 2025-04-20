import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planta_care/app/components/tint_widget_by_level.dart';
import 'package:planta_care/app/enums/toxicity_level.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlantCareSection extends StatelessWidget {
  const PlantCareSection({
    required this.myPlant,
    super.key,
  });

  final MyPlantModel? myPlant;

  @override
  Widget build(BuildContext context) {
    Widget buildCare({
      Widget? icon,
      String? title,
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
            onTap: onTap,
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
                  title ?? '',
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
                    myPlant?.maintenanceDifficulty?.color ??
                        Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                title: myPlant?.maintenanceDifficulty?.title,
                onTap: () {},
              ),
              buildCare(
                icon: TintWidgetByLevel(
                  level: myPlant?.wateringNeeds?.level ?? 0.5,
                  color: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.water_drop,
                    color: Colors.grey[400],
                  ),
                ),
                title: myPlant?.wateringNeeds?.title,
                onTap: () {},
              ),
              buildCare(
                icon: TintWidgetByLevel(
                  level: myPlant?.lightNeeds?.level ?? 0.5,
                  color: Colors.orangeAccent,
                  child: Icon(
                    Icons.sunny,
                    color: Colors.grey[400],
                  ),
                ),
                title: myPlant?.lightNeeds?.title,
                onTap: () {},
              ),
              if (myPlant?.toxicity == ToxicityLevel.toxic)
                buildCare(
                  icon: const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                  ),
                  title: myPlant?.toxicity?.title,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ],
    );
  }
}
