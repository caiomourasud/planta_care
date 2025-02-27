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

  static const String title = 'title';

  static const Map<String, dynamic> en = {
    title: 'Localization',
  };
  static const Map<String, dynamic> es = {
    title: 'Localización',
  };
  static const Map<String, dynamic> br = {
    title: 'Localização',
  };
}
