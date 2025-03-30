import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/firebase/device_collection.dart';

class MyPlantSquareCard extends StatefulWidget {
  const MyPlantSquareCard({
    required this.plant,
    this.onTap,
    super.key,
  });

  final MyPlantModel plant;
  final void Function()? onTap;

  @override
  State<MyPlantSquareCard> createState() => _MyPlantSquareCardState();
}

class _MyPlantSquareCardState extends State<MyPlantSquareCard> {
  DeviceModel? _device;
  StreamSubscription? _deviceSubscription;

  @override
  void initState() {
    super.initState();

    _getDevice();
  }

  Future<void> _getDevice() async {
    if (widget.plant.deviceId == null || widget.plant.deviceId == '') {
      return;
    }
    _deviceSubscription =
        DeviceCollection.listenToDevice(widget.plant.deviceId).listen((device) {
      if (device != null && mounted) {
        setState(() {
          _device = device;
        });
      }
    });
  }

  @override
  void dispose() {
    _deviceSubscription?.cancel();
    super.dispose();
  }

  Widget _statusIcon({
    required Color color,
    required IconData icon,
    required String value,
    required String unit,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            shape: BoxShape.circle,
          ),
          height: 30.0,
          width: 30.0,
          child: Icon(
            icon,
            color: color,
            size: 16.0,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          '$value$unit',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        onTap: widget.onTap,
        minVerticalPadding: 0.0,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 6.0,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/plants/3.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.plant.name ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 4.0),
            IntrinsicHeight(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: _device != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _statusIcon(
                              color: const Color(0xFF23BD59),
                              icon: Icons.water_drop_rounded,
                              value: _device?.moisture?.toString() ?? '',
                              unit: '%',
                            ),
                            _statusIcon(
                              color: const Color(0xFFF6B618),
                              icon: Icons.device_thermostat_outlined,
                              value: _device?.temperature?.toString() ?? '',
                              unit: '°C',
                            ),
                            _statusIcon(
                              color: const Color(0xFF1E73D4),
                              icon: Icons.air_outlined,
                              value: _device?.humidity?.toString() ?? '',
                              unit: '%',
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _statusIcon(
                              color: Colors.grey,
                              icon: Icons.water_drop_rounded,
                              value: '--',
                              unit: '%',
                            ),
                            _statusIcon(
                              color: Colors.grey,
                              icon: Icons.device_thermostat_outlined,
                              value: '--',
                              unit: '°C',
                            ),
                            _statusIcon(
                              color: Colors.grey,
                              icon: Icons.air_outlined,
                              value: '--',
                              unit: '%',
                            ),
                          ],
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
