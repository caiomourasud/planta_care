import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final String _plantName = 'Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => NameYourPlantPage(
                    plantName: _plantName,
                    onNext: (value) {
                      Navigator.pushNamed(
                        context,
                        '/when-did-you-last-water-your-plant',
                      );
                    },
                    onGoBack: () => context.pop(),
                  );
              break;
            case '/when-did-you-last-water-your-plant':
              builder =
                  (BuildContext context) => WhenDidYouLastWaterYourPlantPage(
                        onNext: (value) {
                          Navigator.pushNamed(
                            context,
                            '/where-is-the-plant-placed',
                          );
                        },
                        onGoBack: () => Navigator.pop(context),
                      );
              break;
            case '/where-is-the-plant-placed':
              builder = (BuildContext context) => WhereIsThePlantPlacedPage(
                    onNext: (value) {
                      Navigator.pushNamed(
                        context,
                        '/review-your-plant',
                      );
                    },
                    onGoBack: () => Navigator.pop(context),
                  );
              break;
            case '/review-your-plant':
              builder = (BuildContext innerContext) => ReviewYourPlantPage(
                    onNext: () {
                      context.pop();
                    },
                    onGoBack: () => Navigator.pop(innerContext),
                  );
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onDidRemovePage: (page) {
          debugPrint('onDidRemovePage');
        },
      ),
    );
  }
}
