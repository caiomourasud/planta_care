import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/location_card.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/location_collection.dart';

class MyLocationsPage extends StatefulWidget {
  const MyLocationsPage({super.key});

  @override
  State<MyLocationsPage> createState() => _MyLocationsPageState();
}

class _MyLocationsPageState extends State<MyLocationsPage> {
  StreamSubscription? _locationsSubscription;
  List<PlantSubLocationModel> _locations = [];

  @override
  void initState() {
    super.initState();
    _listenToLocations();
  }

  @override
  void dispose() {
    _locationsSubscription?.cancel();
    super.dispose();
  }

  void _listenToLocations() {
    _locationsSubscription =
        LocationCollection.listenToLocations(Auth.currentUser?.email)
            .listen((locations) {
      setState(() {
        _locations = locations;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      upperBodyTitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        child: Text(
          'My Locations',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16.0,
          children: [
            ..._locations.map((location) => LocationCard(
                  location: location,
                  readOnly: false,
                  onTap: () {},
                  onEditPressed: () {},
                  onDeletePressed: () {},
                )),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
