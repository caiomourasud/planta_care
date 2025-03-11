import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/text_form_field/planta_text_form_field.dart';
import 'package:planta_care/app/enums/plant_location_type.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/pages/add_plant/components/plant_location_type_dropdown_item.dart';

class AddLocationContent extends StatefulWidget {
  const AddLocationContent({
    required this.onLocationCreated,
    this.initialPlantLocationType = PlantLocationType.outdoor,
    super.key,
  });

  final FutureOr<bool> Function(PlantSubLocationModel location)
      onLocationCreated;
  final PlantLocationType initialPlantLocationType;

  @override
  State<AddLocationContent> createState() => _AddLocationContentState();
}

class _AddLocationContentState extends State<AddLocationContent> {
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  PlantLocationType? _selectedLocationType;

  @override
  void initState() {
    super.initState();
    _selectedLocationType = widget.initialPlantLocationType;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                PlantaAppBarButton(
                  context: context,
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Location',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Add a new location for your plants, like a cozy library corner or a sunny patio.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
                DropdownButtonFormField<PlantLocationType>(
                  itemHeight: 60,
                  isDense: false,
                  icon: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 22,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.onSurface.withAlpha(8),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: _selectedLocationType,
                  items: [
                    PlantLocationType.indoor,
                    PlantLocationType.outdoor,
                  ].map((locationType) {
                    return DropdownMenuItem<PlantLocationType>(
                      value: locationType,
                      child: PlantLocationTypeDropdownItem(
                        locationType: locationType,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      _selectedLocationType = value;
                    }
                  },
                ),
                const SizedBox(height: 4.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    IgnorePointer(
                      ignoring: _isLoading,
                      child: Opacity(
                        opacity: _isLoading ? 0.5 : 1.0,
                        child: PlantaTextFormField(
                          context: context,
                          controller: _nameController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          hintText: 'Type name here...',
                          validator: (value) {
                            if (value == null || value.isEmpty) {}
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12.0),
                    IgnorePointer(
                      ignoring: _isLoading,
                      child: Opacity(
                        opacity: _isLoading ? 0.5 : 1.0,
                        child: PlantaTextFormField(
                          context: context,
                          controller: _descriptionController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          hintText: 'Type description here...',
                          validator: (value) {
                            if (value == null || value.isEmpty) {}
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                PlantaFilledButton(
                  context: context,
                  isLoading: _isLoading,
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    final result = await widget.onLocationCreated(
                      PlantSubLocationModel(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        plantLocationType:
                            _selectedLocationType ?? PlantLocationType.indoor,
                      ),
                    );
                    if (result && context.mounted) {
                      context.pop();
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Add Location',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
