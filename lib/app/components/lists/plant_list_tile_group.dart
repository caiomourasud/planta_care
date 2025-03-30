import 'package:flutter/material.dart';

class PlantListTileGroupLockedItem {
  PlantListTileGroupLockedItem({
    this.subtitle,
    this.item,
  });

  final String? subtitle;
  PlantListTileGroupItem? item;
}

class PlantListTileGroupItem {
  PlantListTileGroupItem({
    this.leadingIcon,
    this.label,
    this.description,
    this.onTap,
    this.customContent,
    this.customTrailing,
    this.titleStyle,
  });

  final IconData? leadingIcon;
  final String? label;
  final String? description;
  final void Function()? onTap;
  final Widget? customContent;
  final Widget? customTrailing;
  final TextStyle? titleStyle;
}

class PlantListTileGroup extends StatelessWidget {
  const PlantListTileGroup({
    this.title,
    this.subtitle,
    this.leadingColor,
    this.trailingColor,
    this.items = const [],
    this.lockedItem,
    this.locked = false,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final Color? leadingColor;
  final Color? trailingColor;
  final List<PlantListTileGroupItem> items;
  final PlantListTileGroupLockedItem? lockedItem;
  final bool locked;

  final _radius = const Radius.circular(8.0);

  ShapeBorder? _listTileShape(PlantListTileGroupItem item) {
    final allRoundedBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    );
    final topRoundedBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: _radius, topRight: _radius),
    );
    final bottomRoundedBorder = RoundedRectangleBorder(
      borderRadius:
          BorderRadius.only(bottomLeft: _radius, bottomRight: _radius),
    );

    return items.length == 1 || locked
        ? allRoundedBorder
        : items.first == item
            ? topRoundedBorder
            : items.last == item
                ? bottomRoundedBorder
                : null;
  }

  List<PlantListTileGroupItem> get _lokedItem => [
        PlantListTileGroupItem(
          label: lockedItem?.item?.label ?? 'Locked',
          leadingIcon: Icons.lock_outlined,
        )
      ];

  Widget? leading(BuildContext context, PlantListTileGroupItem item) {
    if (item.customContent != null) return null;
    if (item.leadingIcon == null) return null;
    return Container(
      height: 32.0,
      width: 32.0,
      decoration: BoxDecoration(
        color: locked
            ? Theme.of(context).colorScheme.onSurface.withAlpha(40)
            : leadingColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(
          32.0,
        ),
      ),
      child: Icon(
        item.leadingIcon,
        color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
        size: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tempTitle = title;
    final tempSubtitle = locked ? lockedItem?.subtitle : subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (tempTitle != null)
          Text(
            tempTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        if (tempSubtitle != null) ...[
          if (tempTitle != null) const SizedBox(height: 4.0),
          Text(
            tempSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
        if (tempTitle != null || tempSubtitle != null)
          const SizedBox(height: 8.0),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(40),
            ),
            borderRadius: BorderRadius.all(_radius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: (locked ? _lokedItem : items)
                .map((item) => Column(
                      children: [
                        Theme(
                          data: ThemeData(
                            highlightColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(40),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            shape: _listTileShape(item),
                            tileColor: Theme.of(context).colorScheme.surface,
                            onTap:
                                locked ? lockedItem?.item?.onTap : item.onTap,
                            leading: leading(context, item),
                            minLeadingWidth: 0.0,
                            title: item.customContent ??
                                (item.label != null
                                    ? Text(
                                        item.label ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: item.titleStyle ??
                                            Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                      )
                                    : null),
                            subtitle: item.description != null
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                      top: 4.0,
                                    ),
                                    child: Text(
                                      item.description ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                    ),
                                  )
                                : null,
                            trailing: (item.customContent != null
                                ? null
                                : item.customTrailing ??
                                    Icon(
                                      Icons.arrow_forward,
                                      color: locked
                                          ? Colors.grey.shade500
                                          : trailingColor,
                                      size: 18,
                                    )),
                          ),
                        ),
                        if (items.last != item && !locked)
                          Divider(
                            height: 1.0,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(40),
                          )
                      ],
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
