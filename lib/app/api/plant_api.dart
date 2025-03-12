import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:planta_care/app/models/plant_model.dart';

final dio = Dio();

class PlantApi {
  static Future<PlantModel?> fetchPlantDetails(String plantId) async {
    try {
      final response = await dio.get(
        'https://perenual.com/api/v2/species/details/$plantId',
        queryParameters: {
          'key': 'sk-arHY67d0e6ede8c2d9102',
        },
      );

      if (response.statusCode == 200) {
        final plant = PlantModel.fromJson(response.data);
        return plant;
      } else {
        debugPrint(response.data.toString());
      }
    } catch (e) {
      debugPrint('Failed to load plant details: ${e.toString()}');
    }
    return null;
  }

  static Future<List<PlantModel>?> searchPlant(String query) async {
    try {
      final response = await dio.get(
        'https://perenual.com/api/v2/species-list',
        queryParameters: {'key': 'sk-arHY67d0e6ede8c2d9102', 'q': query},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<PlantModel> plants = data.map((e) {
          final plant = PlantModel.fromJson(e as Map<String, dynamic>);
          return plant;
        }).toList();
        return plants;
      }
    } catch (e) {
      debugPrint('Failed to load plants: ${e.toString()}');
    }
    return null;
  }
}
