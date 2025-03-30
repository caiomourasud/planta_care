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
  // String? _selectedSegment;

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: ScrollControllers.getController('/diagnosis'),
      child: PlantScaffold(
        // appBar: PlantAppBar(
        //   title: PlantaSlidingSegmentedControl<String>(
        //     groupValue: _selectedSegment ?? 'Dr Planta',
        //     onValueChanged: (value) {
        //       setState(() {
        //         _selectedSegment = value;
        //       });
        //     },
        //     children: const ['Dr Planta', 'Explore'],
        //     itemBuilder: (item, selected) => Text(
        //       item,
        //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        //           color: selected
        //               ? Theme.of(context).colorScheme.onPrimary
        //               : Theme.of(context).colorScheme.onSurface,
        //           fontWeight: selected ? FontWeight.bold : FontWeight.normal),
        //     ),
        //   ),
        // ),
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
