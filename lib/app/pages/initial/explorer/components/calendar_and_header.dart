import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planta_care/app/components/buttons/planta_app_bar_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarAndHeader extends StatelessWidget {
  const CalendarAndHeader({
    required this.selectedDate,
    this.firstDay,
    this.onSelectDate,
    this.canGoBackDate = false,
    this.canGoForwardDate = false,
    super.key,
  });

  final DateTime selectedDate;
  final DateTime? firstDay;
  final void Function(DateTime value)? onSelectDate;
  final bool canGoBackDate;
  final bool canGoForwardDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            children: [
              PlantaAppBarButton(
                context: context,
                icon: const Icon(Icons.chevron_left),
                padding: const EdgeInsets.all(10.0),
                onPressed: canGoBackDate
                    ? () {
                        onSelectDate?.call(selectedDate.subtract(
                          const Duration(days: 1),
                        ));
                      }
                    : null,
              ),
              const SizedBox(width: 56.0),
              Expanded(
                child: Text(
                  DateFormat('EEEE, dd MMMM').format(selectedDate),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Tooltip(
                message: 'Today',
                child: PlantaAppBarButton(
                  context: context,
                  icon: Icon(
                    Icons.today,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  onPressed: () {
                    final today = DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                    );
                    onSelectDate?.call(today);
                  },
                ),
              ),
              const SizedBox(width: 8.0),
              PlantaAppBarButton(
                context: context,
                icon: const Icon(Icons.chevron_right),
                padding: const EdgeInsets.all(10.0),
                onPressed: canGoForwardDate
                    ? () {
                        onSelectDate?.call(selectedDate.add(
                          const Duration(days: 1),
                        ));
                      }
                    : null,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        if (firstDay != null) ...[
          TableCalendar(
            headerVisible: false,
            firstDay: firstDay ?? DateTime(2025, 3, 16),
            lastDay: DateTime.now(),
            focusedDay: selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, day);
            },
            calendarFormat: CalendarFormat.week,
            onDaySelected: (day, focusedDay) {
              onSelectDate?.call(day);
            },
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      DateFormat.d().format(day),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(120),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      DateFormat.d().format(day),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(120),
                          ),
                    ),
                  ),
                );
              },
              dowBuilder: (context, day) {
                final text = DateFormat.E().format(day)[0];
                return Center(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(120),
                        ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ],
    );
  }
}
