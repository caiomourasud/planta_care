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
}
