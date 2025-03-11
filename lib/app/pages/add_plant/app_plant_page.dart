import 'package:flutter/material.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/pages/add_plant/name_your_plant.dart';
import 'package:planta_care/app/pages/add_plant/review_your_plant_page.dart';
import 'package:planta_care/app/pages/add_plant/when_did_you_last_water_your_plant.dart';
import 'package:planta_care/app/pages/add_plant/where_is_your_plant_placed.dart';

class AppPlantStep {
  AppPlantStep({
    required this.appBar,
    required this.child,
    this.bottomSheet,
    this.overlayItem,
  });

  final PlantAppBar appBar;
  final Widget child;
  final Widget? bottomSheet;
  final Widget? overlayItem;
}

class AppPlantPage extends StatefulWidget {
  const AppPlantPage({super.key});

  @override
  State<AppPlantPage> createState() => _AppPlantPageState();
}

class _AppPlantPageState extends State<AppPlantPage> {
  final ValueNotifier<String> _currentRoute = ValueNotifier<String>('/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<String>(
        valueListenable: _currentRoute,
        builder: (context, currentRoute, child) {
          return Navigator(
            pages: [
              const MaterialPage(
                child: NameYourPlantPage(
                    // onNext: () =>
                    //     _navigateTo('/when-did-you-last-water-your-plant'),
                    ),
                name: '/',
              ),
              if (currentRoute == '/when-did-you-last-water-your-plant')
                const MaterialPage(
                  child: WhenDidYouLastWaterYourPlantPage(
                      // onNext: () => _navigateTo('/where-is-the-plant-placed'),
                      ),
                  name: '/when-did-you-last-water-your-plant',
                ),
              if (currentRoute == '/where-is-the-plant-placed')
                const MaterialPage(
                  child: WhereIsThePlantPlacedPage(
                      // onNext: () => _navigateTo('/review-your-plant'),
                      ),
                  name: '/where-is-the-plant-placed',
                ),
              if (currentRoute == '/review-your-plant')
                const MaterialPage(
                  child: ReviewYourPlantPage(
                      // onNext: () => _navigateTo('/'),
                      ),
                  name: '/review-your-plant',
                ),
            ],
          );
        },
      ),
    );
  }
}
