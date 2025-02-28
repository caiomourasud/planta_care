import 'package:flutter_localization/flutter_localization.dart';

mixin AppLocale {
  static const mapLocales = [
    MapLocale(
      'en',
      AppLocale.en,
      countryCode: 'US',
    ),
    MapLocale(
      'es',
      AppLocale.es,
      countryCode: 'ES',
    ),
    MapLocale(
      'pt',
      AppLocale.br,
      countryCode: 'BR',
    ),
  ];

  static const String keepYourPlantsAlive = 'keepYourPlantsAlive';
  static const String keepYourPlantsAliveDescription =
      'keepYourPlantsAliveDescription';
  static const String getStartedWithPlanta = 'getStartedWithPlanta';

  static const Map<String, dynamic> en = {
    keepYourPlantsAlive: 'Keep your plants alive',
    keepYourPlantsAliveDescription:
        'Keep your plants alive by watering, providing sunlight, and checking for pests.',
    getStartedWithPlanta: 'Get Started With Planta',
  };
  static const Map<String, dynamic> es = {
    keepYourPlantsAlive: 'Mantén tus plantas vivas',
    keepYourPlantsAliveDescription:
        'Mantén tus plantas vivas regando, dándole luz solar y revisando por insectos.',
    getStartedWithPlanta: 'Comienza con Planta',
  };
  static const Map<String, dynamic> br = {
    keepYourPlantsAlive: 'Mantenha suas plantas vivas',
    keepYourPlantsAliveDescription:
        'Mantenha suas plantas vivas regando, dando luz solar e verificando por insetos.',
    getStartedWithPlanta: 'Comece com Planta',
  };
}
