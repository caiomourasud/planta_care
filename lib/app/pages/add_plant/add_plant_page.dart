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
  MyPlantModel? plant = MyPlantModel(
    name: 'Margarida',
    description: 'Flor das visitas',
    images: ['https://via.placeholder.com/150'],
    lastWatered: LastWatered.yesterday,
    lastFertilization: null,
    locationId: 'zYR5Qrykxcb6Reo0I6XQ',
    deviceId: '3C:8A:1F:AF:7E:A4',
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
                      Navigator.pushNamed(
                        context,
                        '/review-your-plant',
                      );
                    },
                    onGoBack: () => Navigator.pop(context),
                  );
              break;
            case '/review-your-plant':
              builder = (innerContext) => PlantDetailsPage(
                    onNext: () {
                      context.pop();
                    },
                    onGoBack: () => Navigator.pop(innerContext),
                  );
              break;
            case '/':
            default:
              builder = (context) => NameYourPlantPage(
                    plantName: plant?.name,
                    onNext: (value) async {
                      Navigator.pushNamed(
                        context,
                        '/when-did-you-last-water-your-plant',
                      );
                      final result = await PlantCollection.createPlant(
                        Auth.currentUser?.email,
                        plant,
                      );
                      if (result) {
                        print('Plant created successfully');
                      } else {
                        print('Error creating plant');
                      }
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
