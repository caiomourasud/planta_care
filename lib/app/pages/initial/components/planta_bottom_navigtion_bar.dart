import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planta_care/app/pages/initial/components/navigation_bar_button.dart';

class PlantaBottomNavigationBar extends StatelessWidget {
  const PlantaBottomNavigationBar({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });

  final void Function(int) onPressed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: MediaQuery.paddingOf(context).bottom + 4.0,
      ),
      height: 66.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(64.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withAlpha(40),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          spacing: 8.0,
          children: [
            NavigationBarButton(
              isSelected: currentIndex == 0,
              index: 0,
              tooltip: 'Home',
              onPressed: (index) {
                if (index != null) {
                  onPressed(index);
                }
              },
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/home.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                  BlendMode.srcIn,
                ),
              ),
            ),
            NavigationBarButton(
              isSelected: currentIndex == 1,
              index: 1,
              tooltip: 'My Place',
              onPressed: (index) {
                if (index != null) {
                  onPressed(index);
                }
              },
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/my_place.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                  BlendMode.srcIn,
                ),
              ),
            ),
            NavigationBarButton(
              isSelected: currentIndex == 2,
              index: 2,
              tooltip: 'Explorer',
              onPressed: (index) {
                if (index != null) {
                  onPressed(index);
                }
              },
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/search.svg',
                width: 22.0,
                height: 22.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                  BlendMode.srcIn,
                ),
              ),
            ),
            NavigationBarButton(
              isSelected: currentIndex == 3,
              index: 3,
              tooltip: 'Diagnosis',
              onPressed: (index) {
                if (index != null) {
                  onPressed(index);
                }
              },
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/diagnose.svg',
                width: 22.0,
                height: 22.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                  BlendMode.srcIn,
                ),
              ),
            ),
            NavigationBarButton(
              isSelected: currentIndex == 4,
              index: 4,
              tooltip: 'Premium',
              onPressed: (index) {
                if (index != null) {
                  onPressed(index);
                }
              },
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/premium.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
