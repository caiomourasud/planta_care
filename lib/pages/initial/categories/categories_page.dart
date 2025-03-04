import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/components/buttons/planta_outlined_button.dart';
import 'package:planta_care/components/plants_list.dart/my_plants_horizontal_list.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
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
                    context.go('/profile');
                  },
                  icon: const Icon(Icons.person),
                ),
                PlantaAppBarButton(
                  context: context,
                  onPressed: () {},
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
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
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(CupertinoIcons.search),
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
                  const SizedBox(height: 20.0),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 120.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Give a gift that grows and thrives.',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                              const SizedBox(height: 12.0),
                              PlantaOutlinedButton(
                                context: context,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                  ),
                                  child: Text(
                                    'Add plants',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          right: 12.0,
                        ),
                        child: Image.asset(
                          'assets/images/get_started.png',
                          height: 190,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  MyPlantsHorizontalList(
                    title: 'Categories',
                    minCardWidth: 120,
                    onViewAllPressed: () {},
                    items: const [
                      'Category 1',
                      'Category 2',
                      'Category 3',
                      'Category 4',
                      'Category 5',
                    ],
                    itemBuilder: (item, height) {
                      return Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Center(child: Text(item)),
                      );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  MyPlantsHorizontalList(
                    title: 'Popular Plants',
                    onViewAllPressed: () {},
                    items: const [
                      'Plant 1',
                      'Plant 2',
                      'Plant 3',
                      'Plant 4',
                      'Plant 5',
                    ],
                    itemBuilder: (item, height) {
                      return Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Center(child: Text(item)),
                      );
                    },
                  ),
                  SizedBox(height: 96.0 + MediaQuery.paddingOf(context).bottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
