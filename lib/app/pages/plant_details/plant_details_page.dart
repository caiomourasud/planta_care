import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';
import 'package:planta_care/firebase/device_collection.dart';

class PlantDetailsPage extends StatefulWidget {
  const PlantDetailsPage({
    this.onNext,
    this.onGoBack,
    super.key,
  });

  final void Function()? onNext;
  final void Function()? onGoBack;

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  DeviceModel? _device;
  StreamSubscription? _deviceSubscription;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setupDeviceListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    _deviceSubscription?.cancel();
    super.dispose();
  }

  Future<void> _setupDeviceListener() async {
    await _enableRealTime();

    _deviceSubscription =
        DeviceCollection.listenToDevice('3C:8A:1F:AF:7E:A4').listen((device) {
      if (device != null && mounted) {
        setState(() {
          _device = device;
        });
      }
    });
  }

  Future<void> _enableRealTime() async {
    await DeviceCollection.setRealTimeEnabled(
      '3C:8A:1F:AF:7E:A4',
      true,
    );
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy HH:mm:ss').format(timestamp);
  }

  final PlantSubLocationModel _selectedPlantSubLocationType =
      const PlantSubLocationModel(
    id: '1',
    name: 'Location',
    description: 'Location',
  );

  Widget _buildData(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: widget.onGoBack ?? () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      overlayItem: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(
          right: 20.0,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
              ),
              child: Image.asset(
                'assets/images/where_are_your_plants.png',
                height: MediaQuery.sizeOf(context).height * 0.26,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildData('Light', 'Difuse'),
                          const SizedBox(height: 8.0),
                          _buildData('Humidity', '${_device?.humidity}%'),
                        ],
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildData(
                              'Temperature', '${_device?.temperature}°C'),
                          const SizedBox(height: 8.0),
                          _buildData('Moisture', '${_device?.moisture}%'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Last Update:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                  Text(
                    _formatTimestamp(_device?.timestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: PlantaFilledButton(
          context: context,
          onPressed: () => widget.onNext?.call(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Text(
              'Add Plant',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                  ),
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Text(
            'Aloe vera',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12.0),
          Text(
            'Has been used for medical purposes for more than 2.000 years, treahng various ailments. Ancient ovilizations reled on its healing properties for pain relaf and wellness',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Plant Care',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
              Expanded(
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color:
                          Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  tileColor: Theme.of(context).colorScheme.surface,
                  title: const Text('Size'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Location',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            tileColor: Theme.of(context).colorScheme.surface,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: PlantSubLocationService
                                .getIconColorByPlantLocationModel(
                                    _selectedPlantSubLocationType)
                            ?.withAlpha(40) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(20),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Icon(
                    PlantSubLocationService.getIconByPlantLocationModel(
                            _selectedPlantSubLocationType) ??
                        Icons.dashboard_customize,
                    color: PlantSubLocationService
                            .getIconColorByPlantLocationModel(
                                _selectedPlantSubLocationType) ??
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  _selectedPlantSubLocationType.name ?? 'Location',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  _selectedPlantSubLocationType.description ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(120),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
