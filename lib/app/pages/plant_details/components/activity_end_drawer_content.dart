import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_activity_model.dart';
import 'package:planta_care/firebase/auth.dart';
import 'package:planta_care/firebase/plant_activity_collection.dart';

class ActivityEndDrawerContent extends StatefulWidget {
  const ActivityEndDrawerContent({
    required this.onClose,
    required this.plantId,
    super.key,
  });

  final void Function() onClose;
  final String? plantId;

  @override
  State<ActivityEndDrawerContent> createState() =>
      _ActivityEndDrawerContentState();
}

class _ActivityEndDrawerContentState extends State<ActivityEndDrawerContent> {
  StreamSubscription? _activitySubscription;
  List<PlantActivity> _activities = [];

  @override
  void initState() {
    super.initState();
    _activitySubscription?.cancel();
    _activitySubscription = PlantActivityCollection.listenToPlantActivities(
      Auth.currentUser?.email,
      widget.plantId,
    ).listen((event) {
      setState(() {
        _activities = event;
      });
    });
  }

  @override
  void dispose() {
    _activitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: Tooltip(
                      message: 'Close',
                      child: IconButton(
                        onPressed: widget.onClose,
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    'Activity',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              spacing: 12.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ..._activities.map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(e.actionDate?.toString() ?? 'Action Date'),
                        Text(e.title ?? 'Title'),
                        Text(e.actionType?.name ?? 'Action Type'),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
