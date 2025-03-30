import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';
import 'package:planta_care/app/models/user_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/user_collection.dart';

class NameYourPlantPage extends StatefulWidget {
  const NameYourPlantPage({
    this.plantName,
    this.onNext,
    this.onGoBack,
    super.key,
  });

  final String? plantName;
  final void Function(String value)? onNext;
  final void Function()? onGoBack;

  @override
  State<NameYourPlantPage> createState() => _NameYourPlantPageState();
}

class _NameYourPlantPageState extends State<NameYourPlantPage> {
  Map<PlantLocationOption, bool> selectedOptions = {};
  final _plantNameController = TextEditingController();

  UserModel? user;

  @override
  void initState() {
    super.initState();
    _getUser();
    _plantNameController.text = widget.plantName ?? '';
  }

  Future<void> _getUser() async {
    user = await UserCollection.getUserById(Auth.currentUser?.email);
    setState(() {
      selectedOptions = Map.from(user?.plantLocations ?? {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: widget.onGoBack,
          icon: const Icon(Icons.close),
        ),
      ),
      overlayItem: Image.asset(
        'assets/images/name_your_plant.png',
        height: MediaQuery.sizeOf(context).height * 0.30,
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: PlantaFilledButton(
          context: context,
          onPressed: () => widget.onNext?.call(_plantNameController.text),
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
          const SizedBox(height: 8.0),
          Text(
            'Name your plant',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Keep your plants alive by watering, '
            'providing sunlight, '
            'and checking for pests.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            controller: _plantNameController,
            decoration: InputDecoration(
              hintText: 'Type name here...',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
              prefixIconColor:
                  Theme.of(context).colorScheme.onSurface.withAlpha(120),
              focusColor: Theme.of(context).colorScheme.onSurface,
              fillColor: Theme.of(context).colorScheme.onSurface.withAlpha(10),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: SizedBox(
                width: 22.0,
                height: 22.0,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/icons/search.svg',
                    width: 22.0,
                    height: 22.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              ...[
                'Bamboo',
                'Aloe vera',
                'Sunflower',
                'Cactus',
                'Basil',
                'Orchid'
              ].map((e) => ChoiceChip(
                    label: Text(e),
                    selected: false,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(20),
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _plantNameController.text = e;
                      });
                    },
                  )),
            ],
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    );
  }
}
