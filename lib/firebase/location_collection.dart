import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/plant_sub_location_type.dart';
import 'package:planta_care/app/models/plant_sub_location_model.dart';
import 'package:planta_care/app/services/plant_sub_location_service.dart';

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

  static Future<PlantSubLocationModel?> getLocationById(
    String? userId,
    String locationId,
  ) async {
    if (PlantSubLocationType.values.any((e) => e.id == locationId)) {
      return PlantSubLocationService.getPlantSubLocationById(locationId);
    }

    final location = await _locationsCollection(userId)?.doc(locationId).get();
    return location != null
        ? PlantSubLocationModel.fromJson(location.data() ?? {}).copyWith(
            id: location.id,
          )
        : null;
  }

  static Future<bool> createLocation(
    String? userId,
    PlantSubLocationModel location,
  ) async {
    try {
      await _locationsCollection(userId)
          ?.doc(location.id)
          .set(location.copyWith(createdAt: DateTime.now()).toJson());
      return true;
    } catch (e) {
      debugPrint('Error creating location: $e');
      return false;
    }
  }

  static Stream<List<PlantSubLocationModel>> listenToLocations(
    String? userId,
  ) {
    if (userId == null) {
      debugPrint('Not able to retrieve locations collection, User id is null.');
      return Stream.value([]);
    }
    return _locationsCollection(userId)?.snapshots().map((event) => event.docs
            .map((e) => PlantSubLocationModel.fromJson(e.data()).copyWith(
                  id: e.id,
                ))
            .toList()) ??
        Stream.value([]);
  }
}
