import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/models/plant_activity_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/plant_activity_collection.dart';

class IrrigationCard extends StatelessWidget {
  const IrrigationCard({
    required this.plantId,
    super.key,
  });

  final String? plantId;

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy HH:mm:ss').format(timestamp);
  }

  String _formatIrrigationTimestamp(DateTime? timestamp) {
    if (timestamp == null) {
      return '';
    }
    return DateFormat('MM/dd/yyyy').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blueAccent.withAlpha(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: Colors.blueAccent.withAlpha(80),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.water_drop,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Irrigation',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: 'Last Irrigation: ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: <TextSpan>[
                  TextSpan(
                    text: _formatTimestamp(
                      DateTime.now().subtract(
                        const Duration(
                          days: 17,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(180),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                text: 'Next Irrigation: ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: <TextSpan>[
                  TextSpan(
                    text: _formatIrrigationTimestamp(DateTime.now()),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(180),
                        ),
                  ),
                  TextSpan(
                    text: ' (recommended)',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(180),
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            PlantaFilledButton(
              context: context,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    bool isLoading = false;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 24.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Irrigation event',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Icon(
                                Icons.water_drop_rounded,
                                size: 24,
                                color: Colors.blueAccent,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Select the date and time for the irrigation.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: 'Date and time',
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          StatefulBuilder(builder: (context, setState) {
                            return PlantaFilledButton(
                              context: context,
                              isLoading: isLoading,
                              onPressed: () async {
                                if (context.mounted) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                }
                                final newPlantActivity =
                                    await PlantActivityCollection
                                        .addPlantActivity(
                                  userId: Auth.currentUser?.email,
                                  plantId: plantId,
                                  plantActivity: PlantActivity(
                                    title: 'Irrigation',
                                    actionType: PlantActivityType.watering,
                                    actionDate: DateTime.now(),
                                    createdAt: DateTime.now(),
                                  ),
                                );
                                if (context.mounted) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (newPlantActivity == true) {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Add event',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            );
                          }),
                          SizedBox(
                              height:
                                  MediaQuery.paddingOf(context).bottom + 16.0),
                        ],
                      ),
                    );
                  },
                );
              },
              backgroundColor: Colors.blueAccent,
              child: Text(
                'Add Irrigation',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
