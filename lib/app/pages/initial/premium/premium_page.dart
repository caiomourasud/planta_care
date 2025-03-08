import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/pages/initial/premium/components/premium_card.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        trailing: PlantaAppBarButton(
          context: context,
          onPressed: () {},
          icon: const Icon(Icons.share),
        ),
      ),
      parentHasBottomBavigationBar: true,
      overlayItem: Image.asset(
        'assets/images/premium.png',
        height: MediaQuery.sizeOf(context).height * 0.32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Text(
            'What is Planta Premium?',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16.0),
          Column(
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
                description: 'Create a custom care schedule for your plants',
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
        ],
      ),
    );
  }
}
