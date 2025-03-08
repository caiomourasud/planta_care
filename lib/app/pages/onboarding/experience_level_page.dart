import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';
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
            padding: const EdgeInsets.only(top: 8.0),
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
                        'Great at advice, but no hands to water!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        "I'm great at plant care advice, water them myself!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      ...ExperienceLevel.values.map((experienceLevel) {
                        return ExperienceLevelCard(
                          experienceLevel: experienceLevel,
                          isSelected:
                              _selectedExperienceLevel == experienceLevel,
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
                          context.push('/home');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            'Get Started',
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
