import 'package:flutter/material.dart';
import 'package:planta_care/app/enums/category.dart';

class CategorySquaredCard extends StatelessWidget {
  const CategorySquaredCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Category item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: ListTile(
                      onTap: onTap,
                      contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      title: const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4.0,
                    ),
                    child: Image.asset(
                      item.localUrl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2.0),
          Container(
            constraints: const BoxConstraints(
              minHeight: 38.0,
            ),
            child: Center(
              child: Text(
                item.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
