import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/my_plant_square_card.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_vertical_list.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/routes/app_router.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:planta_care/firebase/user_collection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyPlantModel>? _plants;
  StreamSubscription? _plantsSubscription;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    _plantsSubscription?.cancel();
    super.dispose();
  }

  Future<void> _getData() async {
    await Future.wait([
      _getUser(),
      _listenToPlants(),
    ]);
  }

  Future<void> _getUser() async {
    final user = await UserCollection.getUserById(Auth.currentUser?.email);

    debugPrint(user.toString());

    final plantLocations = user?.plantLocations;
    final experienceLevel = user?.experienceLevel;
    final onboardingSkipped = user?.onboardingSkipped;

    if ((plantLocations == null || plantLocations.isEmpty) &&
        onboardingSkipped == false) {
      if (mounted) {
        context.go('/get-started');
        return;
      }
    }
    if (experienceLevel == null && onboardingSkipped == false) {
      if (mounted) {
        context.go('/experience-level');
        return;
      }
    }
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

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PlantaAppBarButton(
                    context: context,
                    onPressed: () {
                      context.push('/home/profile');
                    },
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Caio!',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Curitiba, BR',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(120),
                                  ),
                        )
                      ])
                ],
              ),
              PlantaAppBarButton(
                context: context,
                onPressed: () {
                  AppRouter.navigationShell?.goBranch(3);
                },
                icon: const Icon(Icons.fit_screen_rounded),
              ),
            ],
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: PlantaSlidingSegmentedControl<String>(
              //     groupValue: _selectedSegment ?? 'Indoor',
              //     onValueChanged: (value) {
              //       setState(() {
              //         _selectedSegment = value;
              //       });
              //     },
              //     children: const ['Indoor', 'Outdoor', 'Both'],
              //     itemBuilder: (item, selected) => Text(
              //       item,
              //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //           color: selected
              //               ? Theme.of(context).colorScheme.onPrimary
              //               : Theme.of(context).colorScheme.onSurface,
              //           fontWeight:
              //               selected ? FontWeight.bold : FontWeight.normal),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 20.0),
              MyPlantsHorizontalList<MyPlantModel>(
                title: 'My Plants',
                aspectRatioItem: 7 / 5.7,
                onViewAllPressed: () {
                  AppRouter.navigationShell?.goBranch(1);
                },
                items: _plants ?? [],
                itemBuilder: (item, height) {
                  return MyPlantSquareCard(
                    key: Key(item.id ?? ''),
                    plant: item,
                    onTap: () {
                      context.push('/home/plant-details/${item.id}');
                    },
                  );
                },
              ),
              const SizedBox(height: 20.0),
              MyPlantsVerticalList(
                title: 'Popular Plants',
                onViewAllPressed: () {},
                items: const [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                ],
                itemBuilder: (item, index) => Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  elevation: 0,
                  child: ListTile(
                    onTap: () {},
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 4.0,
                    ),
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          height: 60.0,
                          width: 60.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/plants/$item.png',
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Plant $item',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Keep your plant alive watering.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(120),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        IconButton(
                          style: IconButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {},
                          icon: Container(
                            height: 38.0,
                            width: 28.0,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
