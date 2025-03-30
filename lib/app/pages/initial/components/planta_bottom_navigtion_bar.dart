import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantaBottomNavigationBar extends StatelessWidget {
  const PlantaBottomNavigationBar({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });

  final void Function(int) onPressed;
  final int currentIndex;

  Widget _buildButton(
    BuildContext context,
    int index, {
    String? tooltip,
    Widget? Function(bool isSelected)? icon,
  }) {
    final isSelected = currentIndex == index;
    return Expanded(
      flex: isSelected ? 1 : 0,
      child: Tooltip(
        message: tooltip ?? '',
        child: SizedBox(
          width: 58.0,
          height: 58.0,
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).hoverColor,
            ),
            onPressed: () => onPressed(index),
            icon: icon?.call(isSelected) ??
                Icon(Icons.home,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.grey[500]),
          ),
        ),
      ),
    );
  }

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
            _buildButton(
              context,
              0,
              tooltip: 'Home',
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/home.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.grey[500]!,
                  BlendMode.srcIn,
                ),
              ),
            ),
            _buildButton(
              context,
              1,
              tooltip: 'My Place',
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/my_place.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.grey[500]!,
                  BlendMode.srcIn,
                ),
              ),
            ),
            _buildButton(
              context,
              2,
              tooltip: 'Categories',
              icon: (isSelected) => Icon(
                CupertinoIcons.search,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.grey[500],
              ),
            ),
            _buildButton(
              context,
              3,
              tooltip: 'Diagnosis',
              icon: (isSelected) => Icon(
                Icons.medical_services,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.grey[500],
              ),
            ),
            _buildButton(
              context,
              4,
              tooltip: 'Premium',
              icon: (isSelected) => SvgPicture.asset(
                'assets/svg/icons/premium.svg',
                width: 18.0,
                height: 18.0,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Colors.grey[500]!,
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
