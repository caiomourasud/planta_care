import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_activity_model.dart';

class PlantActivityCollection {
  static CollectionReference<Map<String, dynamic>>? _plantActivitiesCollection(
    String? userId,
    String? plantId,
  ) {
    if (userId == null) {
      debugPrint(
          'Not able to retrieve plant activities collection, User id is null.');
      return null;
    }
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('plants')
          .doc(plantId)
          .collection('activities');
    } catch (e) {
      debugPrint('Error retrieving plant activities collection: $e');
      return null;
    }
  }

  static Future<bool> createPlantActivity(
    String? userId,
    String? plantId,
    PlantActivity? plantActivity,
  ) async {
    if (plantActivity == null) {
      debugPrint('Not able to create plant activity, plant activity is null.');
      return false;
    }
    try {
      final plantActivityJson = plantActivity.toJson();
      final newPlantActivity = await _plantActivitiesCollection(userId, plantId)
          ?.add(plantActivityJson);
      if (newPlantActivity != null) {
        await _plantActivitiesCollection(userId, plantId)
            ?.doc(newPlantActivity.id)
            .update({
          'id': newPlantActivity.id,
        });
      }
      return newPlantActivity != null;
    } catch (e) {
      debugPrint('Error creating plant: $e');
      return false;
    }
  }

  static Future<List<PlantActivity>> getPlantActivities(
    String? userId,
    String? plantId,
  ) async {
    final plantActivities =
        await _plantActivitiesCollection(userId, plantId)?.get();
    return plantActivities?.docs
            .map((e) => PlantActivity.fromJson(e.data()).copyWith(id: e.id))
            .toList() ??
        [];
  }

  static Future<PlantActivity?> getPlantActivityById(
    String? plantId,
    String? userId,
    String? plantActivityId,
  ) async {
    final plantActivity = await _plantActivitiesCollection(userId, plantId)
        ?.doc(plantActivityId)
        .get();
    if (plantActivity == null || !plantActivity.exists) return null;
    return PlantActivity.fromJson(plantActivity.data() ?? {});
  }

  static Future<bool> updatePlantActivity(
    String? userId,
    String? plantId,
    PlantActivity? plantActivity,
  ) async {
    if (plantActivity == null) {
      debugPrint('Not able to update plant activity, plant activity is null.');
      return false;
    }
    try {
      await _plantActivitiesCollection(userId, plantId)
          ?.doc(plantActivity.id)
          .update(plantActivity.toJson());
      return true;
    } catch (e) {
      debugPrint('Error updating plant activity: $e');
      return false;
    }
  }

  static Stream<List<PlantActivity>> listenToPlantActivities(
    String? userId,
    String? plantId,
  ) {
    if (userId == null) {
      debugPrint('Not able to retrieve plants collection, User id is null.');
      return Stream.value([]);
    }
    return _plantActivitiesCollection(userId, plantId)?.snapshots().map(
            (event) => event.docs
                .map((e) => PlantActivity.fromJson(e.data()).copyWith(id: e.id))
                .toList()) ??
        Stream.value([]);
  }
}
