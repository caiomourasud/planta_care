import 'package:freezed_annotation/freezed_annotation.dart';

class LightLevelConverter implements JsonConverter<double?, dynamic> {
  const LightLevelConverter();

  @override
  double? fromJson(dynamic json) {
    if (json is String) {
      return 0.0;
    } else if (json is double) {
      return json;
    } else if (json is int) {
      return json.toDouble();
    }
    return null;
  }

  @override
  dynamic toJson(double? object) => object;
}
