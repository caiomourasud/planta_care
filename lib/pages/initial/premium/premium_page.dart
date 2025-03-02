import 'package:flutter/material.dart';
import 'package:planta_care/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/components/scaffold_elevated_container.dart';
import 'package:planta_care/pages/initial/premium/components/premium_card.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PlantaAppBarButton(
              context: context,
              onPressed: () {},
              icon: const Icon(Icons.fit_screen_rounded),
            ),
          ],
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/premium.png',
                    height: MediaQuery.sizeOf(context).height * 0.32,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'What is Planta Premium?',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 16.0,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PremiumCard(
                              title: 'Plant identifier',
                              description:
                                  'Scan a plant and find out the name and how to care for it',
                              icon: Icons.question_mark_rounded,
                              color: const Color(0xFFFF7563),
                              onTap: () {},
                            ),
                            PremiumCard(
                              title: 'Care schedules',
                              description:
                                  'Create a custom care schedule for your plants',
                              icon: Icons.calendar_month_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              onTap: () {},
                            ),
                            PremiumCard(
                              title: 'Reminders',
                              description:
                                  'Get reminders for watering, fertilizing, and more',
                              icon: Icons.notifications_rounded,
                              color: const Color(0xFF2FB3FD),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
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
