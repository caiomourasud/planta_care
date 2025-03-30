import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/models/my_plant_model.dart';

class PlantCollection {
  static CollectionReference<Map<String, dynamic>>? _plantsCollection(
    String? userId,
  ) {
    if (userId == null) {
      debugPrint('Not able to retrieve plants collection, User id is null.');
      return null;
    }
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('plants');
    } catch (e) {
      debugPrint('Error retrieving plants collection: $e');
      return null;
    }
  }

  static Future<bool> createPlant(
    String? userId,
    MyPlantModel? plant,
  ) async {
    if (plant == null) {
      debugPrint('Not able to create plant, plant is null.');
      return false;
    }
    try {
      await _plantsCollection(userId)?.doc(plant.id).set(plant.toJson());
      return true;
    } catch (e) {
      debugPrint('Error creating location: $e');
      return false;
    }
  }

  static Future<List<MyPlantModel>> getPlants(String? userId) async {
    final plants = await _plantsCollection(userId)?.get();
    return plants?.docs
            .map((e) => MyPlantModel.fromJson(e.data()).copyWith(id: e.id))
            .toList() ??
        [];
  }

  static Future<MyPlantModel?> getPlantById(
    String? plantId,
    String? userId,
  ) async {
    final plant = await _plantsCollection(userId)?.doc(plantId).get();
    if (plant == null || !plant.exists) return null;
    return MyPlantModel.fromJson(plant.data() ?? {}).copyWith(id: plantId);
  }

  static Future<bool> updatePlant(String? userId, MyPlantModel? plant) async {
    if (plant == null) {
      debugPrint('Not able to update plant, plant is null.');
      return false;
    }
    try {
      await _plantsCollection(userId)?.doc(plant.id).update(plant.toJson());
      return true;
    } catch (e) {
      debugPrint('Error updating plant: $e');
      return false;
    }
  }

  static Stream<List<MyPlantModel>> listenToPlants(String? userId) {
    if (userId == null) {
      debugPrint('Not able to retrieve plants collection, User id is null.');
      return Stream.value([]);
    }
    return _plantsCollection(userId)?.snapshots().map((event) => event.docs
            .map((e) => MyPlantModel.fromJson(e.data()).copyWith(id: e.id))
            .toList()) ??
        Stream.value([]);
  }
}
