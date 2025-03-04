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
                aspectRatioItem: 7 / 6,
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
              const SizedBox(height: 20.0),
              MyPlantsVerticalList(
                title: 'Popular Plants',
                onViewAllPressed: () {},
              ),
              SizedBox(height: 96.0 + MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }
}
