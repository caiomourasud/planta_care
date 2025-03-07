import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planta_care/app/enums/plant_location_option.dart';

class PlantLocationOptionsConverter
    implements
        JsonConverter<Map<PlantLocationOption, bool>?, Map<String, dynamic>?> {
  const PlantLocationOptionsConverter();

  @override
  Map<PlantLocationOption, bool>? fromJson(dynamic jsonAttribute) {
    try {
      var result = <PlantLocationOption, bool>{};
      if (jsonAttribute == null) {
        return result;
      }
      if (jsonAttribute is Map) {
        final aux = jsonAttribute as Map<String, dynamic>;
        for (final key in aux.keys) {
          final plantLocationOption = PlantLocationOption.values
              .firstWhereOrNull((option) => option.name == key);
          if (plantLocationOption != null) {
            result[plantLocationOption] = aux[key] as bool;
          }
        }
      }
      return result;
    } catch (e) {
      debugPrint(
        'Error while converting ${jsonAttribute.runtimeType} to PlantLocationOption, json: $jsonAttribute}',
      );
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(Map<PlantLocationOption, bool>? object) {
    final processing = object ?? {};
    var json = <String, dynamic>{};
    for (final key in processing.keys) {
      json[key.name] = processing[key];
    }
    return json;
  }
}
