import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/planta_sliding_segmented_control.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  String? _selectedSegment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            width: double.infinity,
            child: PlantaSlidingSegmentedControl<String>(
              groupValue: _selectedSegment ?? 'Dr Planta',
              onValueChanged: (value) {
                setState(() {
                  _selectedSegment = value;
                });
              },
              children: const ['Dr Planta', 'Explore'],
              itemBuilder: (item, selected) => Text(
                item,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal),
              ),
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
              height: MediaQuery.sizeOf(context).height * 0.45,
            ),
          ),
          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 24.0),
                  Image.asset(
                    'assets/images/diagnosis.png',
                    height: MediaQuery.sizeOf(context).height * 0.48,
                  ),
                  PlantaFilledButton(
                    context: context,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.fit_screen_rounded),
                        const SizedBox(width: 8.0),
                        Text(
                          'Auto diagnose',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    'Plant Care Team',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Get expert plant care advice to help you keep your plants healthy and happy',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                  const SizedBox(height: 52.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
