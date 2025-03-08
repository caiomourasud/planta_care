import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app_locale/app_locale.dart';
import 'package:planta_care/app/components/logo_text_planta.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlantScaffold(
      appBar: const PlantAppBar(
        title: Center(child: LogoTextPlanta()),
      ),
      overlayItem: Container(
        margin: const EdgeInsets.only(
          top: 68.0,
        ),
        child: Image.asset(
          'assets/images/get_started.png',
          height: MediaQuery.sizeOf(context).height * 0.45,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Text(
            AppLocale.keepYourPlantsAlive.getString(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16.0),
          Text(
            AppLocale.keepYourPlantsAliveDescription.getString(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
          ),
          const SizedBox(height: 52.0),
          SwipeButton(
            height: 64.0,
            width: MediaQuery.sizeOf(context).width * 0.65,
            activeTrackColor: Theme.of(context).colorScheme.primary,
            thumbPadding: const EdgeInsets.all(4.0),
            activeThumbColor: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                AppLocale.getStartedWithPlanta.getString(context),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
            onSwipe: () {
              context.push('/where-are-your-plants');
            },
          )
        ],
      ),
    );
  }
}
