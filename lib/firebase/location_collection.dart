import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';

class LocationCollection {
  static CollectionReference<Map<String, dynamic>>? _locationsCollection(
    String? userId,
  ) {
    if (userId == null) {
      debugPrint('Not able to retrieve locations collection, User id is null.');
      return null;
    }
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('locations');
    } catch (e) {
      debugPrint('Error retrieving locations collection: $e');
      return null;
    }
  }

  static Future<List<PlantSubLocationModel>> getLocations(
    String? userId,
  ) async {
    try {
      final locations = await _locationsCollection(userId)?.get();
      return locations?.docs
              .map((doc) => PlantSubLocationModel.fromJson(doc.data()).copyWith(
                    id: doc.id,
                  ))
              .toList() ??
          [];
    } catch (e) {
      debugPrint('Error retrieving locations collection: $e');
      return [];
    }
  }

  static Future<bool> createLocation(
    String? userId,
    PlantSubLocationModel location,
  ) async {
    try {
      await _locationsCollection(userId)
          ?.doc(location.id)
          .set(location.toJson());
      return true;
    } catch (e) {
      debugPrint('Error creating location: $e');
      return false;
    }
  }
}
