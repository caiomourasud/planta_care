import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/firebase/device_collection.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  List<DeviceReadingModel> readings = [];
  List<DeviceReadingModel> filledReadings = [];
  DateTime selectedDate = DateTime.now();
  List<DateTime> weekDates = [];

  DeviceModel? device;
  Timer? _timer;

  void _getCurrentWeekDates() {
    final now = DateTime.now();
    final sunday = now.subtract(Duration(days: now.weekday));

    weekDates = List.generate(7, (index) {
      return DateTime(
        sunday.year,
        sunday.month,
        sunday.day + index,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _selectDate(DateTime.now());
      _getCurrentWeekDates();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _selectDate(DateTime date) async {
    selectedDate = date;
    _getData();
  }

  Future<void> _getData() async {
    _listenToReadings();
  }

  _listenToReadings() {
    DeviceCollection.listenToReadings('3C:8A:1F:AF:7E:A4',
            date: selectedDate.toIso8601String())
        .listen((result) {
      if (mounted) {
        setState(() {
          readings = result;
          filledReadings = _fillMissingReadings(result);
        });
      }
    });
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
    DateTime startTime = selectedDate;

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

  Widget _chart({
    required String title,
    required double? Function(int index) values,
    double? minValue,
    double? maxValue,
    Color? lowColor,
    Color? highColor,
    String? unit,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 3,
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
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(20),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        height: constraints.maxHeight,
                      ),
                      Builder(builder: (context) {
                        final hasItem = values(index) != null;
                        final moisture = hasItem && values(index) != null
                            ? values(index)?.toDouble() ?? 0.0
                            : 0.0;
                        return Tooltip(
                          message: '${moisture.toInt()}${unit ?? '%'}',
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: moisture > (minValue ?? 30)
                                  ? highColor ?? Colors.blue.shade200
                                  : lowColor ?? Colors.red.shade200,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                              ),
                            ),
                            height: moisture *
                                constraints.maxHeight /
                                (maxValue ?? 100),
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
    );
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
      ),
      upperBodyTitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
        child: Text(
          'Charts',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Row(
            spacing: 8.0,
            children: weekDates.map((e) {
              final isSelected = DateTime(selectedDate.year, selectedDate.month,
                      selectedDate.day) ==
                  DateTime(e.year, e.month, e.day);
              return Expanded(
                child: Column(
                  children: [
                    Text(
                      DateFormat('E').format(e)[0],
                      textAlign: TextAlign.center,
                      style: isSelected
                          ? Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              )
                          : Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(120),
                              ),
                    ),
                    const SizedBox(height: 4.0),
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withAlpha(120)
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withAlpha(20),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => _selectDate(e),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _chart(
                title: 'Moisture',
                values: (index) {
                  if (index >= filledReadings.length) {
                    return null;
                  }
                  return filledReadings[index].moisture;
                },
                minValue: 30,
                maxValue: 100,
                lowColor: Colors.blueGrey.shade200,
                highColor: Colors.green.shade200,
              ),
              const SizedBox(height: 20),
              _chart(
                title: 'Temperature',
                values: (index) {
                  if (index >= filledReadings.length) {
                    return null;
                  }
                  return filledReadings[index].temperature;
                },
                minValue: 18,
                maxValue: 45,
                lowColor: Colors.blue.shade200,
                highColor: Colors.orange.shade200,
                unit: '°C',
              ),
              const SizedBox(height: 20),
              _chart(
                title: 'Humidity',
                values: (index) {
                  if (index >= filledReadings.length) {
                    return null;
                  }
                  return filledReadings[index].humidity;
                },
                minValue: 30,
                maxValue: 100,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
