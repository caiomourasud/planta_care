import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/routes/app_router.dart';

class NavigationBarButton extends StatelessWidget {
  const NavigationBarButton({
    this.isSelected = false,
    this.tooltip,
    this.icon,
    this.onPressed,
    this.index,
    super.key,
  });

  final bool isSelected;
  final String? tooltip;
  final Widget? Function(bool isSelected)? icon;
  final void Function(int? index)? onPressed;
  final int? index;

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              final String route = GoRouterState.of(context).uri.path;
              final basePath = route.split('/').take(3).join('/');
              final controller = ScrollControllers.getController(basePath);
              if (controller.hasClients && isSelected) {
                if (controller.position.pixels > 0.0) {
                  controller.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.ease,
                  );
                  return;
                }
              }

              if (isSelected) {
                if (context.canPop()) {
                  context.pop();
                } else {
                  onPressed?.call(index);
                }
              } else {
                onPressed?.call(index);
              }
            },
            icon: icon?.call(isSelected) ??
                Icon(
                  Icons.home,
                  color: isSelected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface.withAlpha(130),
                ),
          ),
        ),
      ),
    );
  }
}
