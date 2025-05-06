import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/app/models/my_plant_model.dart';
import 'package:planta_care/app/pages/initial/explorer/components/calendar_and_header.dart';
import 'package:planta_care/app/pages/initial/explorer/components/daily_chart.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/device_collection.dart';
import 'package:planta_care/firebase/plant_collection.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  String? deviceId;
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

  bool _canGoBackDate() {
    final dateAux = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final firstDayAux = DateTime(
      firstDay?.year ?? 2025,
      firstDay?.month ?? 3,
      firstDay?.day ?? 16,
    );
    return firstDayAux.isBefore(dateAux);
  }

  bool _canGoForwardDate() {
    final dateAux = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );
    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    return today.isAfter(dateAux);
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
        deviceId = plant?.deviceId;
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
        dateTime.year,
        dateTime.month,
        dateTime.day,
        dateTime.hour,
        0,
      );
    } else if (minutes < 45) {
      return DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        dateTime.hour,
        30,
      );
    } else {
      return DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        dateTime.hour + 1,
        0,
      );
    }
  }

  List<DeviceReadingModel> _fillMissingReadings(
    List<DeviceReadingModel> readings,
  ) {
    DateTime startTime = selectedDate;

    Map<DateTime, DeviceReadingModel> readingMap = {
      for (int i = 0; i < 48; i++)
        startTime.add(Duration(minutes: i * 30)): DeviceReadingModel(
          timestamp: startTime.add(Duration(minutes: i * 30)),
        )
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
            CalendarAndHeader(
              selectedDate: selectedDate,
              firstDay: firstDay,
              canGoBackDate: _canGoBackDate(),
              canGoForwardDate: _canGoForwardDate(),
              onSelectDate: _selectDate,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DailyChart(
                      title: 'Moisture',
                      values: (index) {
                        if (index >= filledReadings.length) {
                          return null;
                        }
                        return filledReadings[index].moisturePercentage;
                      },
                      minValue: 0,
                      maxValue: 100,
                      lowColor: Colors.blueGrey.shade200,
                      highColor: Colors.green.shade200,
                    ),
                    const SizedBox(height: 10.0),
                    DailyChart(
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
                    DailyChart(
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
                    DailyChart(
                      title: 'Light',
                      values: (index) {
                        if (index >= filledReadings.length) {
                          return null;
                        }
                        return filledReadings[index].light;
                      },
                      minValue: 0,
                      maxValue: filledReadings.isNotEmpty
                          ? filledReadings
                              .map((e) => e.light ?? 601)
                              .reduce((a, b) => a > b ? a : b)
                          : 0.0 > 601
                              ? filledReadings
                                  .map((e) => e.light ?? 601)
                                  .reduce((a, b) => a > b ? a : b)
                              : 601,
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
