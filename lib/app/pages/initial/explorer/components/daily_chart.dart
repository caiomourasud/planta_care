import 'package:flutter/material.dart';

class DailyChart extends StatelessWidget {
  const DailyChart({
    required this.title,
    required this.values,
    this.minValue,
    this.maxValue,
    this.lowColor,
    this.highColor,
    this.unit,
    super.key,
  });

  final String title;
  final double? Function(int index) values;
  final double? minValue;
  final double? maxValue;
  final Color? lowColor;
  final Color? highColor;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 2.5,
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Row(
                  spacing: 2.0,
                  children: List.generate(48, (index) {
                    return Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(20),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            height: constraints.maxHeight,
                          ),
                          Builder(builder: (context) {
                            final hasItem = values(index) != null;
                            final data = hasItem && values(index) != null
                                ? values(index)?.toDouble() ?? 0.0
                                : 0.0;
                            return Tooltip(
                              message: '${data.toInt()}${unit ?? '%'}',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                  color: data > (minValue ?? 30)
                                      ? highColor ?? Colors.blue.shade200
                                      : lowColor ?? Colors.red.shade200,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(2),
                                    bottomRight: Radius.circular(2),
                                  ),
                                ),
                                height: data *
                                    constraints.maxHeight /
                                    (maxValue ?? 100),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }),
        ),
        const SizedBox(height: 2.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('00:00',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(120),
                    )),
            Text(
              '12:00',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(120),
                  ),
            ),
            Text('23:30',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(120),
                    )),
          ],
        ),
      ],
    );
  }
}
