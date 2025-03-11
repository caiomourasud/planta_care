import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';

class ReviewYourPlantPage extends StatefulWidget {
  const ReviewYourPlantPage({super.key});

  @override
  State<ReviewYourPlantPage> createState() => _ReviewYourPlantPageState();
}

class _ReviewYourPlantPageState extends State<ReviewYourPlantPage> {
  final PlantSubLocationModel _selectedPlantSubLocationType =
      const PlantSubLocationModel(
    id: '1',
    name: 'Location',
    description: 'Location',
  );

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      overlayItem: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          right: 20.0,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
              ),
              child: Image.asset(
                'assets/images/where_are_your_plants.png',
                height: MediaQuery.sizeOf(context).height * 0.30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Size',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
                Text(
                  'Small',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Humidity',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
                Text(
                  '55.7%',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Light',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
                Text(
                  'Difuse',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: PlantaFilledButton(
          context: context,
          onPressed: () {
            context.go('/');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Text(
              'Add Plant',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Text(
            'Aloe vera',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12.0),
          Text(
            'Has been used for medical purposes for more than 2.000 years, treahng various ailments. Ancient ovilizations reled on its healing properties for pain relaf and wellness',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Plant Care',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Location',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            tileColor: Theme.of(context).colorScheme.surface,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: PlantSubLocationService
                                .getIconColorByPlantLocationModel(
                                    _selectedPlantSubLocationType)
                            ?.withAlpha(40) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    PlantSubLocationService.getIconByPlantLocationModel(
                            _selectedPlantSubLocationType) ??
                        Icons.dashboard_customize,
                    color: PlantSubLocationService
                            .getIconColorByPlantLocationModel(
                                _selectedPlantSubLocationType) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  _selectedPlantSubLocationType.name ?? 'Location',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  _selectedPlantSubLocationType.description ?? '',
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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
