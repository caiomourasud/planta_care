import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/last_watered.dart';
import 'package:planta_care/app/pages/onboarding/components/plant_location_option_card.dart';

class WhenDidYouLastWaterYourPlantPage extends StatefulWidget {
  const WhenDidYouLastWaterYourPlantPage({
    this.onNext,
    this.onGoBack,
    super.key,
  });

  final void Function(LastWatered? value)? onNext;
  final void Function()? onGoBack;

  @override
  State<WhenDidYouLastWaterYourPlantPage> createState() =>
      _WhenDidYouLastWaterYourPlantPageState();
}

class _WhenDidYouLastWaterYourPlantPageState
    extends State<WhenDidYouLastWaterYourPlantPage> {
  LastWatered? selectedOption = LastWatered.today;

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: widget.onGoBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      overlayItem: Image.asset(
        'assets/images/where_are_your_plants.png',
        height: MediaQuery.sizeOf(context).height * 0.30,
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: PlantaFilledButton(
          context: context,
          onPressed: () {
            widget.onNext?.call(selectedOption);
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
      child: Column(
        spacing: 16.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12.0),
          Text(
            'When did you last water this plant',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: LastWatered.values
                .map((option) => PlantOptionCard(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 0.0,
                      ),
                      option: option,
                      isSelected: option == selectedOption,
                      onSelected: (option) {
                        setState(() => selectedOption = option);
                      },
                      buildTitle: (option) => option.label,
                    ))
                .toList(),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
