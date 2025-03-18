import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/firebase/device_collection.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<DeviceReadingModel> readings = [];
  List<DeviceReadingModel> filledReadings = [];

  DeviceModel? device;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _getData();
    _setupTimers();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _setupTimers() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _getRealTimeData();
    });

    _scheduleNextReading();
  }

  void _scheduleNextReading() {
    final now = DateTime.now();
    final minutes = now.minute;
    final seconds = now.second;

    Duration timeUntilNext;
    if (minutes < 30) {
      timeUntilNext = Duration(minutes: 30 - minutes, seconds: -seconds);
    } else {
      timeUntilNext = Duration(minutes: 60 - minutes, seconds: -seconds);
    }

    _timer = Timer(timeUntilNext, () {
      _getReadings();
      _timer = Timer.periodic(const Duration(minutes: 30), (timer) {
        _getReadings();
      });
    });
  }

  Future<void> _getData() async {
    _getReadings();
    _getRealTimeData();
  }

  void _getReadings() async {
    final result = await DeviceCollection.fetchReadings('3C:8A:1F:AF:7E:A4',
        date: DateTime(2025, 3, 18).toIso8601String());
    if (mounted) {
      setState(() {
        readings = result;
        filledReadings = _fillMissingReadings(result);
      });
    }
  }

  void _getRealTimeData() async {
    final result = await DeviceCollection.getDeviceById('3C:8A:1F:AF:7E:A4');
    if (result != null && mounted) {
      setState(() {
        device = result;
      });
    }
  }

  DateTime? _roundToNearestHalfHour(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    final minutes = dateTime.minute;
    if (minutes < 15) {
      return DateTime(
          dateTime.year, dateTime.month, dateTime.day, dateTime.hour, 0);
    } else if (minutes < 45) {
      return DateTime(
          dateTime.year, dateTime.month, dateTime.day, dateTime.hour, 30);
    } else {
      return DateTime(
          dateTime.year, dateTime.month, dateTime.day, dateTime.hour + 1, 0);
    }
  }

  List<DeviceReadingModel> _fillMissingReadings(
    List<DeviceReadingModel> readings,
  ) {
    DateTime startTime = DateTime(2025, 3, 18, 0, 0);

    Map<DateTime, DeviceReadingModel> readingMap = {
      for (int i = 0; i < 48; i++)
        startTime.add(Duration(minutes: i * 30)): DeviceReadingModel(
            timestamp: startTime.add(Duration(minutes: i * 30)))
    };

    for (var reading in readings) {
      final roundedTime = _roundToNearestHalfHour(reading.timestamp);
      if (roundedTime != null) {
        readingMap[roundedTime] = reading.copyWith(timestamp: roundedTime);
      }
    }

    final sortedReadings = readingMap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sortedReadings.map((e) => e.value).toList();
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return 'N/A';
    }
    return DateFormat('MM/dd/yyyy HH:mm:ss').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        trailing: Text('Charts', style: Theme.of(context).textTheme.titleLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          Text('Real Time', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Moisture: ${device?.moisture}%',
                  style: Theme.of(context).textTheme.titleLarge),
              Text('Light: ${device?.light}',
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Text('Last check: ${_formatTimestamp(device?.timestamp)}',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 40),
          Text('Moisture', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 4,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                spacing: 2.0,
                children: List.generate(48, (index) {
                  return Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          height: constraints.maxHeight,
                        ),
                        if (filledReadings.length > index)
                          Builder(builder: (context) {
                            final moisture =
                                filledReadings[index].moisture?.toDouble() ?? 0;
                            return Tooltip(
                              message: '${moisture.toInt()}%',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: moisture > 30
                                      ? Colors.blue.shade200
                                      : Colors.red.shade200,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                  ),
                                ),
                                height: moisture * constraints.maxHeight / 100,
                              ),
                            );
                          }),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          const SizedBox(height: 40),
          Text('Brightness', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 16 / 4,
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                spacing: 2.0,
                children: List.generate(48, (index) {
                  return Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          height: constraints.maxHeight,
                        ),
                        if (filledReadings.length > index)
                          Builder(builder: (context) {
                            final brightness =
                                filledReadings[index].light == "Bright";
                            final darkness =
                                filledReadings[index].light == "Dark";
                            return Tooltip(
                              message: brightness
                                  ? 'Bright'
                                  : darkness
                                      ? 'Dark'
                                      : '',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: brightness
                                      ? Colors.orange.shade200
                                      : darkness
                                          ? Colors.blueGrey.shade200
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                height: constraints.maxHeight,
                              ),
                            );
                          }),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        ],
      ),
    );
  }
}
