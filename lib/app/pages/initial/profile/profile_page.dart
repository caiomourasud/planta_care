import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/components/planta_sliding_segmented_control.dart';
import 'package:planta_care/app/components/promotional_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _selectedSegment;

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

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        trailing: PlantaAppBarButton(
          context: context,
          onPressed: () {},
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
                'Caio Moura',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                'Flutter Developer',
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
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildKeyValueVertical('20', 'Plants'),
                ),
                Expanded(
                  child: _buildKeyValueVertical('50', 'Sites'),
                ),
                Expanded(
                  child: _buildKeyValueVertical('100', 'Photos'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          PlantaSlidingSegmentedControl<String>(
            backgroundColor:
                Theme.of(context).colorScheme.onSurface.withAlpha(20),
            groupValue: _selectedSegment ?? 'Plants',
            onValueChanged: (value) {
              setState(() {
                _selectedSegment = value;
              });
            },
            children: const ['Plants', 'Sites', 'Photos'],
            itemBuilder: (item, selected) => Text(
              item,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal),
            ),
          ),
          const SizedBox(height: 20.0),
          PromotionalCard(
            title: 'Living Room',
            description:
                'Living room plants enhance beauty, air relaxing ambiance.',
            actionButton: PlantaFilledButton(
              context: context,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text('Add plants'),
              ),
              onPressed: () {
                context.push('/name-your-plant');
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            image: Image.asset(
              'assets/images/get_started.png',
              height: 190,
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
            descriptionStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
            actionButton: PlantaFilledButton(
              context: context,
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Learn more',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
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
    );
  }
}
