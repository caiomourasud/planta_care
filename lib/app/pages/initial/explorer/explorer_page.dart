import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/api/plant_api.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/app/components/promotional_card.dart';
import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/enums/popular_plant.dart';
import 'package:planta_care/app/models/plant_model.dart';
import 'package:planta_care/app/pages/initial/popular_plants_page/square_popular_plant_card.dart';
import 'package:planta_care/app/routes/app_router.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
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
                        actionButton: PlantaFilledButton(
                          context: context,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
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
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                    MyPlantsHorizontalList<Category>(
                      aspectRatioItem: 7 / 4.8,
                      title: 'Categories',
                      minCardWidth: 120,
                      onViewAllPressed: () {
                        context.push('/categories');
                      },
                      items: Category.values,
                      itemBuilder: (item, height) {
                        return GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 32.0),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 0,
                                        child: ListTile(
                                          onTap: () {},
                                          contentPadding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          title: const SizedBox(
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IgnorePointer(
                                      ignoring: true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 4.0,
                                        ),
                                        child: Image.asset(
                                          item.localUrl,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2.0),
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 38.0,
                                ),
                                child: Center(
                                  child: Text(
                                    item.title,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(height: 0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20.0),
                    MyPlantsHorizontalList<PopularPlant>(
                      title: 'Popular Plants',
                      aspectRatioItem: 7 / 5.7,
                      onViewAllPressed: () {
                        context.push('/home/popular-plants');
                      },
                      items: PopularPlant.values.reversed.take(5).toList(),
                      itemBuilder: (item, height) {
                        return SquarePopularPlantCard(
                          key: Key(item.id),
                          plant: item,
                          onTap: () {
                            context
                                .push('/add-plant?popularPlantId=${item.id}');
                          },
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
