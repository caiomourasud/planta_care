import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';
import 'package:planta_care/app/enums/plant_sub_location_type.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class WhereIsThePlantPlacedPage extends StatefulWidget {
  const WhereIsThePlantPlacedPage({super.key});

  @override
  State<WhereIsThePlantPlacedPage> createState() =>
      _WhereIsThePlantPlacedPageState();
}

class _WhereIsThePlantPlacedPageState extends State<WhereIsThePlantPlacedPage> {
  PlantLocationType? _selectedPlantLocationType = PlantLocationType.indoor;
  PlantSubLocationType? _selectedPlantSubLocationType =
      PlantSubLocationType.livingRoom;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: PlantaAppBarButton(
              context: context,
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  UserCollection.updateUserOnboardingSkipped(
                    Auth.currentUser?.email,
                    true,
                  );
                  context.go('/home');
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: ScaffoldElevatedContainer(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: SafeArea(
                  bottom: true,
                  child: Column(
                    spacing: 16.0,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Where is the plant placed',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      DropdownButtonFormField<PlantLocationType>(
                        itemHeight: 60,
                        isDense: false,
                        icon: const Icon(
                          CupertinoIcons.chevron_down,
                          size: 22,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(8),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: _selectedPlantLocationType,
                        items: [
                          PlantLocationType.indoor,
                          PlantLocationType.outdoor,
                        ].map((locationType) {
                          return DropdownMenuItem<PlantLocationType>(
                            value: locationType,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(40),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  height: 44,
                                  width: 44,
                                  child: Icon(
                                    locationType.icon,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${locationType.title} sites',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      locationType.description,
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
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedPlantLocationType = value;
                            _selectedPlantSubLocationType =
                                _selectedPlantLocationType?.subLocations.first;
                          });
                        },
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 7 / 6,
                        ),
                        itemCount:
                            _selectedPlantLocationType?.subLocations.length ??
                                0,
                        itemBuilder: (context, index) {
                          final location =
                              _selectedPlantLocationType?.subLocations[index];
                          return Material(
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  _selectedPlantSubLocationType = location;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: _selectedPlantSubLocationType ==
                                          location
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(20),
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              tileColor: Theme.of(context).colorScheme.surface,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8.0),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: (location?.color ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .surface)
                                          .withAlpha(40),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Icon(
                                      location?.icon,
                                      color: location?.color ??
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    location?.title ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(location?.description ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withAlpha(120),
                                          )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      PlantaFilledButton(
                        context: context,
                        onPressed: () {
                          context.push('/when-did-you-last-water-your-plant');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            'Next',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
