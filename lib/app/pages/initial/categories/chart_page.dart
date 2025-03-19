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
      _setupTimers();
      _getCurrentWeekDates();
    });
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

  void _selectDate(DateTime date) async {
    selectedDate = date;
    _getData();
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
      _getReadings(selectedDate);
      _timer = Timer.periodic(const Duration(minutes: 30), (timer) {
        _getReadings(selectedDate);
      });
    });
  }

  Future<void> _getData() async {
    await _getReadings(selectedDate);
    _getRealTimeData();
    setState(() {});
  }

  Future<void> _getReadings(DateTime date) async {
    final result = await DeviceCollection.fetchReadings('3C:8A:1F:AF:7E:A4',
        date: date.toIso8601String());
    if (mounted) {
      setState(() {
        readings = result;
        filledReadings = _fillMissingReadings(result);
      });
    }
  }

  Future<void> _getRealTimeData() async {
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

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return '';
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
      overlayItem: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            Text('Real Time', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Moisture: ${device?.moisture ?? 0}%',
                    style: Theme.of(context).textTheme.titleLarge),
                Text('Light: ${device?.light ?? ''}',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            Text('Last check: ${_formatTimestamp(device?.timestamp)}',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 70),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const SizedBox(height: 40),
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )
                          : Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
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
                                  ? Colors.grey[500]
                                  : Colors.grey[300],
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
                            Builder(builder: (context) {
                              final hasItem = filledReadings.length > index;
                              final moisture = hasItem &&
                                      filledReadings[index].moisture != null
                                  ? filledReadings[index]
                                          .moisture
                                          ?.toDouble() ??
                                      0
                                  : 0;
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
                                  height:
                                      moisture * constraints.maxHeight / 100,
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
                            Builder(builder: (context) {
                              final hasItem = filledReadings.length > index;
                              final brightness = hasItem &&
                                  filledReadings[index].light == "Bright";
                              final darkness = hasItem &&
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
        ],
      ),
    );
  }
}
