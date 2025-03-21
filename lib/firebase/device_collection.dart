import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/models/device_model.dart';
import 'package:planta_care/app/models/device_reading_model.dart';

class DeviceCollection {
  static CollectionReference<Map<String, dynamic>> _devicesCollection() {
    return FirebaseFirestore.instance.collection('devices');
  }

  static DocumentReference<Map<String, dynamic>>? _deviceDoc(String? deviceId) {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return null;
    }
    return _devicesCollection().doc(deviceId);
  }

  static CollectionReference<Map<String, dynamic>>? _readingsCollection(
      String? deviceId) {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return null;
    }
    return _deviceDoc(deviceId)?.collection('readings');
  }

  static Future<bool> createDevice(String? deviceId) async {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return false;
    }
    try {
      await _deviceDoc(deviceId)?.set(
        const DeviceModel().toJson(),
      );
      return true;
    } catch (e) {
      debugPrint('Failed Creating User => $e');
    }
    return false;
  }

  static Future<DeviceModel?> getDeviceById(String? deviceId) async {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return null;
    }
    return _deviceDoc(deviceId)
        ?.get()
        .then((value) => DeviceModel.fromJson(value.data() ?? {}));
  }

  static Future<List<DeviceReadingModel>> fetchReadings(
    String? deviceId, {
    String? date,
  }) async {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return [];
    }
    final collection = _readingsCollection(deviceId);
    if (collection == null) return [];

    final dateOnly = date?.split('T')[0];

    final query = dateOnly != null
        ? collection
            .where(FieldPath.documentId,
                isGreaterThanOrEqualTo: "${dateOnly}T00:00:00Z")
            .where(FieldPath.documentId, isLessThan: "${dateOnly}T23:59:59Z")
            .orderBy(FieldPath.documentId)
        : collection;

    final querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) => DeviceReadingModel.fromJson(doc.data()))
        .toList();
  }

  static Future<bool> setRealTimeEnabled(
    String? deviceId,
    bool enabled,
  ) async {
    if (deviceId == null) {
      debugPrint('Device ID is null');
      return false;
    }
    try {
      await _deviceDoc(deviceId)?.update(
        {'realTimeEnabled': enabled},
      );
      return true;
    } catch (e) {
      debugPrint('Failed to set real time enabled => $e');
    }
    return false;
  }
}
