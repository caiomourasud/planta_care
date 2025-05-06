import 'package:flutter/material.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/enums/popular_plant.dart';
import 'package:planta_care/app/pages/onboarding/components/plant_location_option_card.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({
    this.popularPlant,
    this.onNext,
    this.onGoBack,
    super.key,
  });

  final PopularPlant? popularPlant;
  final void Function(Category? value)? onNext;
  final void Function()? onGoBack;

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  Category? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.popularPlant != null) {
      selectedOption = widget.popularPlant?.category ?? Category.foliage;
    }
  }

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
            'Select a category',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: Category.values
                .map((option) => PlantOptionCard(
                      option: option,
                      isSelected: selectedOption == option,
                      onSelected: (option) {
                        setState(() => selectedOption = option);
                      },
                      buildIcon: (Category option) {
                        return option.icon;
                      },
                      buildTitle: (Category option) {
                        return option.title;
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
