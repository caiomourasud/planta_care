import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/experience_level.dart';
import 'package:planta_care/app/pages/onboarding/components/expirience_level_card.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class ExperienceLevelPage extends StatefulWidget {
  const ExperienceLevelPage({super.key});

  @override
  State<ExperienceLevelPage> createState() => _ExperienceLevelPageState();
}

class _ExperienceLevelPageState extends State<ExperienceLevelPage> {
  ExperienceLevel? _selectedExperienceLevel;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    final user = await UserCollection.getUserById(Auth.currentUser?.email);
    setState(() {
      _selectedExperienceLevel = user?.experienceLevel;
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
      child: Column(
        spacing: 16.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24.0),
          Text(
            'Great at advice, but no hands to water!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            "I'm great at plant care advice, water them myself!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 4.0),
          ...ExperienceLevel.values.map((experienceLevel) {
            return ExperienceLevelCard(
              experienceLevel: experienceLevel,
              isSelected: _selectedExperienceLevel == experienceLevel,
              onSelected: (experienceLevel) {
                UserCollection.updateUserExperienceLevel(
                  Auth.currentUser?.email,
                  experienceLevel,
                );
                setState(() {
                  _selectedExperienceLevel = experienceLevel;
                });
              },
            );
          }),
          const SizedBox(height: 4.0),
          PlantaFilledButton(
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
                'Get Started',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
