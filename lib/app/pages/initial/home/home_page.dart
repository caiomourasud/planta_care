import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/my_plant_square_card.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_vertical_list.dart';
import 'package:planta_care/app/enums/popular_plant.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/pages/initial/popular_plants_page/horizontal_popular_plant_card.dart';
import 'package:planta_care/app/routes/app_router.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:planta_care/firebase/user_collection.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  List<MyPlantModel> _plants = [];
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
    setState(() {
      _isLoading = true;
    });
    _plantsSubscription =
        PlantCollection.listenToPlants(Auth.currentUser?.email)
            .listen((plants) {
      setState(() {
        _plants = plants;
        _isLoading = false;
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
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/home'),
      child: Scaffold(
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
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
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
                  icon: SvgPicture.asset(
                    'assets/svg/icons/scan.svg',
                    width: 22.0,
                    height: 22.0,
                    fit: BoxFit.contain,
                  ),
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
            primary: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0),
                if (_plants.isNotEmpty || _isLoading) ...[
                  MyPlantsHorizontalList<MyPlantModel>(
                    title: 'My Plants',
                    aspectRatioItem: 7 / 5.7,
                    onViewAllPressed: () {
                      AppRouter.navigationShell?.goBranch(1);
                    },
                    items: _plants.isEmpty
                        ? const [
                            MyPlantModel(id: '1'),
                            MyPlantModel(id: '2'),
                            MyPlantModel(id: '3'),
                          ]
                        : _plants,
                    itemBuilder: (item, height) {
                      return Skeletonizer(
                        enabled: _isLoading && _plants.isEmpty == true,
                        child: MyPlantSquareCard(
                          key: Key(item.id ?? ''),
                          plant: item,
                          onTap: () {
                            context.push('/plant-details/${item.id}');
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
                MyPlantsVerticalList<PopularPlant>(
                  title: 'Popular Plants',
                  onViewAllPressed: () {
                    context.push('/home/popular-plants');
                  },
                  items: PopularPlant.values.take(5).toList(),
                  itemBuilder: (item, index) => HorizontalPopularPlantCard(
                    plant: item,
                    onTap: () {
                      context.push('/add-plant?popularPlantId=${item.name}');
                    },
                  ),
                ),
                SizedBox(height: 96.0 + MediaQuery.paddingOf(context).bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
