import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';
import 'package:planta_care/app/models/user_model.dart';
import 'package:planta_care/app/pages/onboarding/components/plant_location_option_card.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class WhereAreYourPlantsPage extends StatefulWidget {
  const WhereAreYourPlantsPage({super.key});

  @override
  State<WhereAreYourPlantsPage> createState() => _WhereAreYourPlantsPageState();
}

class _WhereAreYourPlantsPageState extends State<WhereAreYourPlantsPage> {
  Map<PlantLocationOption, bool> selectedOptions = {};

  UserModel? user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    user = await UserCollection.getUserById(Auth.currentUser?.email);
    setState(() {
      selectedOptions = Map.from(user?.plantLocations ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      overlayItem: Image.asset(
        'assets/images/where_are_your_plants.png',
        height: MediaQuery.sizeOf(context).height * 0.32,
      ),
      bottomSheet: Row(
        children: [
          Center(
            child: PlantaFilledButton(
              context: context,
              backgroundColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(20),
              onPressed: () {
                UserCollection.updateUserOnboardingSkipped(
                  FirebaseAuth.instance.currentUser?.email,
                  true,
                );
                context.go('/home');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: PlantaFilledButton(
              context: context,
              onPressed: () {
                context.push('/experience-level');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Next',
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
        children: [
          const SizedBox(height: 24.0),
          const SizedBox(height: 24.0),
          Text(
            'Where are your plants',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'You can pick multiple options',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 32.0),
          Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: PlantLocationOption.values
                .map((option) => PlantOptionCard(
                      option: option,
                      isSelected: selectedOptions[option] ?? false,
                      onSelected: (option) {
                        if (selectedOptions[option] ?? false) {
                          selectedOptions.remove(option);
                        } else {
                          selectedOptions[option] = true;
                        }
                        setState(() {});
                        UserCollection.updateUserPlantsLocation(
                          FirebaseAuth.instance.currentUser?.email,
                          selectedOptions,
                        );
                      },
                      buildIcon: (PlantLocationOption option) {
                        return option.icon;
                      },
                      buildTitle: (PlantLocationOption option) {
                        return option.title;
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
