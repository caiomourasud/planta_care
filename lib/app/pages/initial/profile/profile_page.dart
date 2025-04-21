import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/components/promotional_card.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/models/user_model.dart';
import 'package:planta_care/app/routes/app_router.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/location_collection.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:planta_care/firebase/user_collection.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  StreamSubscription? _plantsSubscription;
  StreamSubscription? _locationsSubscription;
  StreamSubscription? _userSubscription;

  List<MyPlantModel>? _plants;
  List<PlantSubLocationModel>? _locations;
  UserModel? _user;
  @override
  void initState() {
    super.initState();
    _listenToPlants();
    _listenToLocations();
    _listenToUser();
  }

  @override
  void dispose() {
    _plantsSubscription?.cancel();
    _locationsSubscription?.cancel();
    _userSubscription?.cancel();
    super.dispose();
  }

  _listenToPlants() {
    _plantsSubscription =
        PlantCollection.listenToPlants(Auth.currentUser?.email ?? '')
            .listen((plants) {
      setState(() {
        _plants = plants;
      });
    });
  }

  _listenToLocations() {
    _locationsSubscription =
        LocationCollection.listenToLocations(Auth.currentUser?.email ?? '')
            .listen((locations) {
      setState(() {
        _locations = locations;
      });
    });
  }

  _listenToUser() {
    _userSubscription =
        UserCollection.listenToUser(Auth.currentUser?.email ?? '')
            .listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  Widget _buildKeyValueVertical(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
              ),
        ),
      ],
    );
  }

  Widget _buildTitleAndDescription(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(80),
              ),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/home/profile'),
      child: PlantScaffold(
        appBar: PlantAppBar(
          leading: PlantaAppBarButton(
            context: context,
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          trailing: PlantaAppBarButton(
            context: context,
            onPressed: () {
              context.push('/my-place/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ),
        parentHasBottomBavigationBar: true,
        overlayItem: Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          height: 84.0,
          width: 84.0,
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _user?.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                Text(
                  _user?.profession ?? _user?.email ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: _buildTitleAndDescription(
                      'Experience Level', _user?.experienceLevel?.title ?? ''),
                ),
                const SizedBox(width: 20.0),
                if (_user?.city != null && _user?.country != null) ...[
                  Expanded(
                    child: _buildTitleAndDescription(
                        'Location', '${_user?.city}, ${_user?.country}'),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildKeyValueVertical(
                        '${_plants?.length ?? 0}', 'Plants'),
                  ),
                  Expanded(
                    child: _buildKeyValueVertical(
                        '${_locations?.length ?? 0}', 'Locations'),
                  ),
                  Expanded(
                    child: _buildKeyValueVertical('0', 'Photos'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            PromotionalCard(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: 'Planta Premium',
              titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
              description:
                  'Access to in-depth tools for taking of your cost plants',
              descriptionStyle:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
              actionButton: PlantaFilledButton(
                context: context,
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'Learn more',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                onPressed: () {
                  context.go('/premium');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
