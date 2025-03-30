import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/api/plant_api.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_outlined_button.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/components/promotional_card.dart';
import 'package:planta_care/app/models/plant_model.dart';
import 'package:planta_care/app/pages/initial/categories/charts_page.dart';
import 'package:planta_care/app/routes/app_router.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<PlantModel> _searchPlants = [];

  Timer? _debounceTimer;

  Future<void> _searchPlant(String query) async {
    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(seconds: 2), () {
      PlantApi.searchPlant(query).then((plants) {
        setState(() {
          _searchPlants = plants ?? [];
        });
        debugPrint(_searchPlants.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/categories'),
      child: KeyboardDismissOnTap(
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
                  PlantaAppBarButton(
                    context: context,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChartsPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
            elevation: 0,
            scrolledUnderElevation: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                _searchPlant(value);
                              },
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(120),
                                    ),
                                prefixIconColor: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(120),
                                focusColor:
                                    Theme.of(context).colorScheme.onSurface,
                                fillColor:
                                    Theme.of(context).colorScheme.surface,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60.0),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: SizedBox(
                                  width: 22.0,
                                  height: 22.0,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/svg/icons/search.svg',
                                      width: 22.0,
                                      height: 22.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          PlantaAppBarButton(
                            context: context,
                            onPressed: () {},
                            icon: Icon(
                              Icons.tune_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: PromotionalCard(
                        title: 'Give a gift that grows and thrives.',
                        titleStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                        actionButton: PlantaOutlinedButton(
                          context: context,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              'Add plant',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ),
                          onPressed: () {
                            context.push('/add-plant');
                          },
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        image: Image.asset(
                          'assets/images/give_a_gift.png',
                          height: 190,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    MyPlantsHorizontalList(
                      aspectRatioItem: 7 / 5,
                      title: 'Categories',
                      minCardWidth: 120,
                      onViewAllPressed: () {},
                      items: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10',
                      ],
                      itemBuilder: (item, height) {
                        return Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 44.0,
                                    ),
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      elevation: 0,
                                      child: Center(child: Text(item)),
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/plants/$item.png',
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Category $item',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20.0),
                    MyPlantsHorizontalList(
                      title: 'Popular Plants',
                      aspectRatioItem: 7 / 5.7,
                      onViewAllPressed: () {},
                      items: const [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                      ],
                      itemBuilder: (item, height) {
                        return Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/plants/$item.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                SizedBox(
                                  height: 52.0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Plant $item',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              'Indoor',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
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
                                      SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: IconButton(
                                          style: IconButton.styleFrom(
                                            side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            shape: const CircleBorder(),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                        height: 96.0 + MediaQuery.paddingOf(context).bottom),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
