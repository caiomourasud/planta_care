import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/my_plant_horizontal_card.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_vertical_list.dart';
import 'package:planta_care/app/components/promotional_card.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/pages/add_plant/components/location_icon.dart';
import 'package:planta_care/app/routes/app_router.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/location_collection.dart';
import 'package:planta_care/firebase/plant_collection.dart';

class MyPlacePage extends StatefulWidget {
  const MyPlacePage({super.key});

  @override
  State<MyPlacePage> createState() => _MyPlacePageState();
}

class _MyPlacePageState extends State<MyPlacePage> {
  List<PlantSubLocationModel> _plantSubLocations = [];
  List<MyPlantModel> _plants = [];

  StreamSubscription? _plantsSubscription;
  StreamSubscription? _plantSubLocationsSubscription;

  @override
  void initState() {
    super.initState();
    _listenToPlants();
    _listenToPlantSubLocations();
  }

  @override
  void dispose() {
    _plantsSubscription?.cancel();
    _plantSubLocationsSubscription?.cancel();
    super.dispose();
  }

  Future<void> _listenToPlants() async {
    _plantsSubscription =
        PlantCollection.listenToPlants(Auth.currentUser?.email)
            .listen((plants) {
      setState(() {
        _plants = plants;
      });
    });
  }

  Future<void> _listenToPlantSubLocations() async {
    _plantSubLocationsSubscription =
        LocationCollection.listenToLocations(Auth.currentUser?.email)
            .listen((locations) {
      final combinedLocations = <String, PlantSubLocationModel>{};
      for (var location in locations) {
        final id = location.id;
        if (id != null) {
          combinedLocations[id] = location;
        }
      }

      setState(() {
        _plantSubLocations = combinedLocations.values.toList();
        _plantSubLocations.sort((a, b) =>
            (b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0)
                .toInt());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/my-place'),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlantaAppBarButton(
                  context: context,
                  onPressed: () {
                    context.push('/home/profile');
                  },
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
          elevation: 0,
          scrolledUnderElevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              MyPlantsHorizontalList(
                title: 'My Locations',
                aspectRatioItem: 4 / 7,
                onViewAllPressed: () {
                  context.push('/my-place/my-locations');
                },
                items: _plantSubLocations,
                itemBuilder: (item, height) {
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: ListTile(
                      onTap: () {},
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: LocationIcon(location: item),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item.name ?? 'Location',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PromotionalCard(
                  title: 'Living Room',
                  description:
                      'Living room plants enhance beauty, air relaxing ambiance.',
                  actionButton: PlantaFilledButton(
                    context: context,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text('Add plant'),
                    ),
                    onPressed: () {
                      context.push('/add-plant');
                    },
                  ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  image: Image.asset(
                    'assets/images/get_started.png',
                    height: 190,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MyPlantsVerticalList<MyPlantModel>(
                title: 'My Plants',
                items: _plants,
                itemBuilder: (item, index) => MyPlantHorizontalCard(
                  plant: item,
                  onTap: () {
                    context.push('/home/plant-details/${item.id}');
                  },
                ),
              ),
              SizedBox(height: 96.0 + MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }
}
