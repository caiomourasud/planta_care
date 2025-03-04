import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/components/planta_sliding_segmented_control.dart';
import 'package:planta_care/components/plants_list.dart/my_plants_horizontal_list.dart';
import 'package:planta_care/components/plants_list.dart/my_plants_vertical_list.dart';
import 'package:planta_care/firebase/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedSegment;

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
                      context.go('/profile');
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
                  Auth.signOut(context: context);
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PlantaSlidingSegmentedControl<String>(
                  groupValue: _selectedSegment ?? 'Indoor',
                  onValueChanged: (value) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  },
                  children: const ['Indoor', 'Outdoor', 'Both'],
                  itemBuilder: (item, selected) => Text(
                    item,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: selected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MyPlantsHorizontalList(
                title: 'My Plants',
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.water_drop_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withAlpha(120),
                                        size: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    const Text('100%'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.sunny,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withAlpha(120),
                                        size: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    const Text('Sunny'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        shape: BoxShape.circle,
                                      ),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.air_outlined,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withAlpha(120),
                                        size: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    const Text('100'),
                                  ],
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
                itemBuilder: (item) => Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
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
