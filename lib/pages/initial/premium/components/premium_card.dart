import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        onTap: onTap,
        tileColor: Theme.of(context).hoverColor,
        title: Row(
          spacing: 12.0,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: color,
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4.0,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
