import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/category.dart';

class HorizontalCategoryCard extends StatefulWidget {
  const HorizontalCategoryCard({
    required this.category,
    super.key,
    this.onTap,
  });

  final Category category;
  final void Function()? onTap;

  @override
  State<HorizontalCategoryCard> createState() => _HorizontalCategoryCardState();
}

class _HorizontalCategoryCardState extends State<HorizontalCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      child: ListTile(
        onTap: widget.onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              height: 60.0,
              width: 60.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.category.localUrl,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.category.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.category.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
