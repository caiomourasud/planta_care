class PlantDataService {
  static double convertMoistureLevelInPercentage(double moistureLevel) {
    if (moistureLevel <= 0) {
      return 0;
    }
    if (moistureLevel < 100) {
      return moistureLevel;
    }
    double umidade = ((moistureLevel - 3900) / (1000 - 3500)) * 100;
    if (umidade <= 0) {
      return 0;
    }
    return double.parse(umidade.toStringAsFixed(1));
  }
}
