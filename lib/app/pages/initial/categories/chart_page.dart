import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/models/device_reading_model.dart';
import 'package:planta_care/firebase/device_collection.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<DeviceReadingModel> readings = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final result = await DeviceCollection.fetchReadings('3C:8A:1F:AF:7E:A4',
        date: DateTime(2025, 3, 17).toIso8601String());
    setState(() {
      readings = result;
    });
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
                        if (readings.length > index)
                          Builder(builder: (context) {
                            final moisture =
                                readings[index].moisture?.toDouble() ?? 0;
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
                        if (readings.length > index)
                          Builder(builder: (context) {
                            final brightness =
                                readings[index].light == "Bright";
                            return Tooltip(
                              message: brightness ? 'Bright' : 'Dark',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: brightness
                                      ? Colors.orange.shade200
                                      : Colors.blueGrey.shade200,
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
