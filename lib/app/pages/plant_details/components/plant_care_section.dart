import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlantCareSection extends StatelessWidget {
  const PlantCareSection({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildCare({
      Widget? icon,
      String? title,
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
        Row(
          spacing: 16.0,
          children: [
            Expanded(
              child: buildCare(
                icon: SvgPicture.asset(
                  'assets/svg/icons/my_place.svg',
                  width: 20.0,
                  height: 20.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Easy',
                onTap: () {},
              ),
            ),
            Expanded(
              child: buildCare(
                icon: const Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                ),
                title: 'Low',
                onTap: () {},
              ),
            ),
            Expanded(
              child: buildCare(
                icon: const Icon(
                  Icons.sunny,
                  color: Colors.orange,
                ),
                title: 'Medium',
                onTap: () {},
              ),
            ),
            Expanded(
              child: buildCare(
                icon: const Icon(
                  Icons.warning_rounded,
                  color: Colors.red,
                ),
                title: 'Toxic',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
