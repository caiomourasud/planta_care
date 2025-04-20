import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/device_collection.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({
    required this.plantId,
    super.key,
  });

  final String plantId;
  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  bool _isLoading = true;
  List<DeviceReadingModel> readings = [];
  List<DeviceReadingModel> filledReadings = [];
  DateTime selectedDate = DateTime.now();
  List<DateTime> weekDates = [];

  DeviceModel? device;
  String deviceId = '';
  DateTime? firstDay;

  MyPlantModel? plant;

  String get _imagePath =>
      plant?.localUrl ??
      plant?.category?.localUrl ??
      'assets/images/where_are_your_plants.png';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _selectDate(DateTime.now());
    });
  }

  void _selectDate(DateTime date) async {
    selectedDate = DateTime(date.year, date.month, date.day);
    _getData();
  }

  Future<void> _getPlant() async {
    final plant = await PlantCollection.getPlantById(
        widget.plantId, Auth.currentUser?.email ?? '');
    if (mounted) {
      setState(() {
        this.plant = plant;
        deviceId = plant?.deviceId ?? '';
        firstDay = plant?.deviceAddedAt ?? DateTime.now();
      });
    }
  }

  Future<void> _getData() async {
    await _getPlant();
    _listenToReadings();
  }

  void _listenToReadings() {
    DeviceCollection.listenToReadings(deviceId,
            date: selectedDate.toIso8601String())
        .listen((result) {
      if (mounted) {
        setState(() {
          readings = result;
          filledReadings = _fillMissingReadings(result);
          _isLoading = false;
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
          aspectRatio: 16 / 2.5,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Row(
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
                            final data = hasItem && values(index) != null
                                ? values(index)?.toDouble() ?? 0.0
                                : 0.0;
                            return Tooltip(
                              message: '${data.toInt()}${unit ?? '%'}',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: data > (minValue ?? 30)
                                      ? highColor ?? Colors.blue.shade200
                                      : lowColor ?? Colors.red.shade200,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                  ),
                                ),
                                height: data *
                                    constraints.maxHeight /
                                    (maxValue ?? 100),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }),
        ),
        const SizedBox(height: 2.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '00:00',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
            Text(
              '12:00',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
            Text('23:30',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(120),
                    )),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      avoidScroll: true,
      appBar: PlantAppBar(
        leading: PlantaAppBarButton(
          context: context,
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        trailing: Skeletonizer(
          enabled: _isLoading,
          child: Image.asset(
            _imagePath,
            height: MediaQuery.sizeOf(context).height * 0.26,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight * 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            Text(
              DateFormat('EEEE, dd MMMM').format(selectedDate),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            TableCalendar(
              headerVisible: false,
              firstDay: firstDay ?? DateTime(2025, 3, 16),
              lastDay: DateTime.now(),
              focusedDay: selectedDate,
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate, day);
              },
              calendarFormat: CalendarFormat.week,
              onDaySelected: (day, focusedDay) {
                setState(() {
                  _selectDate(day);
                });
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        DateFormat.d().format(day),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  );
                },
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.primary.withAlpha(120),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        DateFormat.d().format(day),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                            ),
                      ),
                    ),
                  );
                },
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day)[0];
                  return Center(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(120),
                          ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
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
                    const SizedBox(height: 10.0),
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
                      lowColor: Colors.lightBlue.shade100,
                      highColor: Colors.lightBlueAccent.shade100,
                      unit: '°C',
                    ),
                    const SizedBox(height: 10.0),
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
                      lowColor: Colors.blueGrey.shade100,
                      highColor: Colors.blueGrey.shade300,
                    ),
                    const SizedBox(height: 10.0),
                    _chart(
                      title: 'Light',
                      values: (index) {
                        if (index >= filledReadings.length) {
                          return null;
                        }
                        return (filledReadings[index].light ?? 0.0) > 601
                            ? 601
                            : filledReadings[index].light;
                      },
                      minValue: 0,
                      maxValue: 601,
                      unit: 'lux',
                      highColor: Colors.orange.shade200,
                      lowColor: Colors.blue.shade200,
                    ),
                    SizedBox(
                      height: MediaQuery.paddingOf(context).bottom + 12.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
