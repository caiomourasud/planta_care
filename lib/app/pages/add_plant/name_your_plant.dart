import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';
import 'package:planta_care/app/models/user_model.dart';
import 'package:planta_care/app/pages/onboarding/components/plant_location_option_card.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class NameYourPlantPage extends StatefulWidget {
  const NameYourPlantPage({super.key});

  @override
  State<NameYourPlantPage> createState() => _NameYourPlantPageState();
}

class _NameYourPlantPageState extends State<NameYourPlantPage> {
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
                context.pop();
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
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ScaffoldElevatedContainer(
              height: MediaQuery.sizeOf(context).height * 0.60,
            ),
          ),
          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/where_are_your_plants.png',
                    height: MediaQuery.sizeOf(context).height * 0.32,
                  ),
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
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 16.0,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: PlantLocationOption.values
                              .map((option) => PlantLocationOptionCard(
                                    option: option,
                                    isSelected:
                                        selectedOptions[option] ?? false,
                                    onSelected: (option) {
                                      if (selectedOptions[option] ?? false) {
                                        selectedOptions.remove(option);
                                      } else {
                                        selectedOptions[option] = true;
                                      }
                                      setState(() {});
                                      UserCollection.updateUserPlantsLocation(
                                        FirebaseAuth
                                            .instance.currentUser?.email,
                                        selectedOptions,
                                      );
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Center(
                        child: PlantaFilledButton(
                          context: context,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(20),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
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
                            context.go('/home');
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
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
