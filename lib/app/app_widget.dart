import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:planta_care/app_locale/app_locale.dart';
import 'package:planta_care/app/routes/app_router.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: AppLocale.mapLocales,
      initLanguageCode: 'en',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Planta Care',
      debugShowCheckedModeBanner: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      localeListResolutionCallback: (locales, supportedLocales) {
        if (locales?.isNotEmpty ?? false) {
          _localization.translate(locales?.first.languageCode ?? 'en');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });
          return locales?.first;
        }
        return const Locale('en', 'US');
      },
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: const Color(0xFFEBF1F1),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF81b434),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: const Color(0xFF2A2B2B),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF81b434),
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
