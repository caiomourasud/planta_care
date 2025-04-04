import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/last_watered.dart';
import 'package:planta_care/app/enums/plant_health_status.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/pages/add_plant/name_your_plant.dart';
import 'package:planta_care/app/pages/plant_details/plant_details_page.dart';
import 'package:planta_care/app/pages/add_plant/when_did_you_last_water_your_plant.dart';
import 'package:planta_care/app/pages/add_plant/where_is_your_plant_placed.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/plant_collection.dart';

class AddPlantStep {
  AddPlantStep({
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

class AddPlantPage extends StatefulWidget {
  const AddPlantPage({super.key});

  @override
  State<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  String? _plantName;
  String? _plantLocationId;
  LastWatered? _lastWatered;

  final MyPlantModel _plant = MyPlantModel(
    name: '',
    description: '',
    images: [],
    lastWatered: null,
    lastFertilization: null,
    locationId: '',
    deviceId: '',
    plantId: null,
    healthStatus: PlantHealthStatus.healthy,
    createdAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/when-did-you-last-water-your-plant':
              builder = (context) => WhenDidYouLastWaterYourPlantPage(
                    onNext: (value) {
                      _lastWatered = value;
                      Navigator.pushNamed(
                        context,
                        '/where-is-the-plant-placed',
                      );
                    },
                    onGoBack: () => Navigator.pop(context),
                  );
              break;
            case '/where-is-the-plant-placed':
              builder = (context) => WhereIsThePlantPlacedPage(
                    onNext: (value) {
                      _plantLocationId = value;
                      Navigator.pushNamed(
                        context,
                        '/review-your-plant',
                      );
                    },
                    onGoBack: () => Navigator.pop(context),
                  );
              break;
            case '/review-your-plant':
              builder = (innerContext) {
                final updatePlant = _plant.copyWith(
                  name: _plantName,
                  locationId: _plantLocationId,
                  lastWatered: _lastWatered,
                );
                return PlantDetailsPage(
                  plant: updatePlant,
                  onNext: () async {
                    context.pop();

                    final result = await PlantCollection.createPlant(
                      Auth.currentUser?.email,
                      updatePlant,
                    );
                    if (result) {
                      debugPrint('Plant created successfully');
                    } else {
                      debugPrint('Error creating plant');
                    }
                  },
                  onGoBack: () => Navigator.pop(innerContext),
                );
              };
              break;
            case '/':
            default:
              builder = (context) => NameYourPlantPage(
                    onNext: (value) async {
                      _plantName = value;
                      Navigator.pushNamed(
                        context,
                        '/when-did-you-last-water-your-plant',
                      );
                    },
                    onGoBack: () => context.pop(),
                  );
              break;
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
