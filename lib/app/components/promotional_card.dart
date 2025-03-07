import 'package:flutter/material.dart';

class PromotionalCard extends StatelessWidget {
  const PromotionalCard({
    this.title,
    this.titleStyle,
    this.description,
    this.descriptionStyle,
    this.actionButton,
    this.image,
    this.backgroundColor,
    super.key,
  });

  final String? title;
  final TextStyle? titleStyle;
  final String? description;
  final TextStyle? descriptionStyle;
  final Widget? actionButton;
  final Widget? image;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final description = this.description;
    final actionButton = this.actionButton;
    final image = this.image;
    final backgroundColor = this.backgroundColor;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.only(
              right: image != null ? 120.0 : 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: titleStyle ??
                        Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                  ),
                if (description != null) ...[
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: descriptionStyle ??
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(120),
                            ),
                  ),
                ],
                const SizedBox(height: 12.0),
                if (image != null)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: actionButton,
                  )
                else if (actionButton != null)
                  actionButton,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
            right: 12.0,
          ),
          child: image,
        ),
      ],
    );
  }
}
