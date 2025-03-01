import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(40),
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
              ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Divider(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(40),
          ),
        ),
      ],
    );
  }
}
