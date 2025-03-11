import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';
import 'package:planta_care/app/enums/plant_sub_location_type.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/pages/add_plant/components/add_location_content.dart';
import 'package:planta_care/app/pages/add_plant/components/plant_location_type_dropdown_item.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/location_collection.dart';

class WhereIsThePlantPlacedPage extends StatefulWidget {
  const WhereIsThePlantPlacedPage({
    super.key,
    this.onNext,
    this.onGoBack,
  });

  final void Function(PlantLocationType? value)? onNext;
  final void Function()? onGoBack;

  @override
  State<WhereIsThePlantPlacedPage> createState() =>
      _WhereIsThePlantPlacedPageState();
}

class _WhereIsThePlantPlacedPageState extends State<WhereIsThePlantPlacedPage> {
  PlantLocationType _selectedPlantLocationType = PlantLocationType.indoor;

  PlantSubLocationModel _selectedPlantSubLocationType =
      PlantSubLocationService.getPlantSubLocationById(
    PlantSubLocationType.livingRoom.id,
  )!;

  PlantSubLocationModel get firstCard {
    return plantSubLocations.first;
  }

  List<PlantSubLocationModel> _plantSubLocations = [];
  List<PlantSubLocationModel> get plantSubLocations => _plantSubLocations;

  Future<void> _getPlantSubLocations() async {
    final locations =
        await LocationCollection.getLocations(Auth.currentUser?.email);
    final localSubLocations = PlantSubLocationService.getPlantSubLocations();

    final combinedLocations = <String, PlantSubLocationModel>{};

    for (var location in locations) {
      final id = location.id;
      if (id != null) {
        combinedLocations[id] = location;
      }
    }

    for (var localLocation in localSubLocations) {
      final id = localLocation.id;
      if (id != null) {
        combinedLocations[id] = localLocation;
      }
    }

    setState(() {
      _plantSubLocations = combinedLocations.values
          .toList()
          .where((location) =>
              location.plantLocationType == _selectedPlantLocationType)
          .toList();
      _plantSubLocations.sort((a, b) =>
          (b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0).toInt());
      _selectedPlantSubLocationType = _plantSubLocations.first;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPlantSubLocations();
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: widget.onGoBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      bottomSheet: Row(
        spacing: 16.0,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: PlantaFilledButton(
              context: context,
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return AddLocationContent(
                        initialPlantLocationType: _selectedPlantLocationType,
                        onLocationCreated: (location) async {
                          try {
                            final result =
                                await LocationCollection.createLocation(
                              Auth.currentUser?.email,
                              location,
                            );
                            await _getPlantSubLocations();
                            return result;
                          } catch (e) {
                            return false;
                          }
                        },
                      );
                    },
                    fullscreenDialog: true,
                  ),
                );
              },
              backgroundColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Add Location',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PlantaFilledButton(
              context: context,
              onPressed: () => widget.onNext?.call(_selectedPlantLocationType),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Select Location',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: Column(
        spacing: 16.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8.0),
          Text(
            'Where is the plant placed',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
              fillColor: Theme.of(context).colorScheme.onSurface.withAlpha(8),
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
                child: PlantLocationTypeDropdownItem(
                  locationType: locationType,
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                _selectedPlantLocationType = value;
                _selectedPlantSubLocationType = firstCard;
              }
              _getPlantSubLocations();
            },
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 7 / 6,
            ),
            itemCount: plantSubLocations.length,
            itemBuilder: (context, index) {
              final location = plantSubLocations[index];
              return Material(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _selectedPlantSubLocationType = location;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: _selectedPlantSubLocationType == location
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
                          color: PlantSubLocationService
                                      .getIconColorByPlantLocationModel(
                                          location)
                                  ?.withAlpha(40) ??
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(20),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Icon(
                          PlantSubLocationService.getIconByPlantLocationModel(
                                  location) ??
                              Icons.dashboard_customize,
                          color: PlantSubLocationService
                                  .getIconColorByPlantLocationModel(location) ??
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        location.name ?? 'Location',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        location.description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    );
  }
}
