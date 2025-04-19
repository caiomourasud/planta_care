import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/category.dart';
import 'package:planta_care/app/pages/initial/explorer/categories/horizontal_category_card.dart';
import 'package:planta_care/app/routes/app_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/explorer/categories'),
      child: PlantScaffold(
        appBar: PlantAppBar(
          leading: PlantaAppBarButton(
            context: context,
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        upperBodyTitle: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              ...Category.values.map((category) => HorizontalCategoryCard(
                    category: category,
                  )),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
