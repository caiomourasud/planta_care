import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planta_care/app/components/buttons/planta_filled_button.dart';
import 'package:planta_care/app/components/plant_scaffold.dart';
import 'package:planta_care/app/routes/app_router.dart';

class DiagnosisPage extends StatefulWidget {
  const DiagnosisPage({super.key});

  @override
  State<DiagnosisPage> createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/diagnosis'),
      child: PlantScaffold(
        parentHasBottomBavigationBar: true,
        overlayItem: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Image.asset(
            'assets/images/diagnosis.png',
            height: MediaQuery.sizeOf(context).height * 0.34,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            PlantaFilledButton(
              context: context,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/icons/scan.svg',
                    width: 22.0,
                    height: 22.0,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'Auto diagnose',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Plant Care Team',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Get expert plant care advice to help you keep your plants healthy and happy',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
