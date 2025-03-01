import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoTextPlanta extends StatelessWidget {
  const LogoTextPlanta({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/icon.svg',
          width: 32.0,
          height: 32.0,
          semanticsLabel: 'Planta Care',
        ),
        Text(
          'Planta',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
