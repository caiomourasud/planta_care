import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:planta_care/app/components/scaffold_elevated_container.dart';
import 'package:planta_care/app/services/measure_size.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PlantAppBar {
  const PlantAppBar({
    this.title,
    this.leading,
    this.trailing,
    this.background,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final Widget? background;
}

class PlantScaffold extends StatefulWidget {
  const PlantScaffold({
    required this.child,
    this.overlayItem,
    this.appBar,
    this.contentPadding,
    this.background,
    this.parentHasBottomBavigationBar = false,
    this.bottomSheet,
    super.key,
  });

  final Widget child;
  final Widget? overlayItem;
  final PlantAppBar? appBar;
  final EdgeInsets? contentPadding;
  final Widget? background;
  final bool parentHasBottomBavigationBar;
  final Widget? bottomSheet;

  @override
  State<PlantScaffold> createState() => _PlantScaffoldState();
}

class _PlantScaffoldState extends State<PlantScaffold> {
  double _overlayItemHeight = 0.0;
  bool? _bottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    final overlayItem = widget.overlayItem;
    final appBarLeading = widget.appBar?.leading;
    final appBarTitle = widget.appBar?.title;
    final appBarTrailing = widget.appBar?.trailing;
    final background = widget.background;
    final bottomSheet = widget.bottomSheet;

    return KeyboardDismissOnTap(
      child: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible && _bottomSheetVisible == true) {
          _bottomSheetVisible = false;
        }
        return Theme(
          data: Theme.of(context).copyWith(
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomSheet: _bottomSheetVisible == true
                ? Padding(
                    padding: EdgeInsets.only(
                      left: widget.contentPadding?.left ?? 20.0,
                      right: widget.contentPadding?.right ?? 20.0,
                      bottom: MediaQuery.paddingOf(context).bottom,
                    ),
                    child: widget.bottomSheet,
                  )
                : const SizedBox(),
            body: Stack(
              children: [
                if (background != null)
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: background,
                  ),
                Container(
                  margin: EdgeInsets.only(
                    top: _overlayItemHeight > 0.0
                        ? (MediaQuery.paddingOf(context).top +
                                        kToolbarHeight +
                                        20.0) +
                                    _overlayItemHeight >
                                0.0
                            ? _overlayItemHeight + 32.0
                            : 0.0
                        : MediaQuery.paddingOf(context).top +
                            kToolbarHeight +
                            20.0,
                  ),
                  child: ScaffoldElevatedContainer(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: _overlayItemHeight > 0.0 ? 48.0 : 0.0,
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: widget.contentPadding?.left ?? 20.0,
                              right: widget.contentPadding?.right ?? 20.0,
                              bottom: MediaQuery.paddingOf(context).bottom +
                                  (widget.parentHasBottomBavigationBar
                                      ? 90.0
                                      : 0.0),
                            ),
                            child: Material(
                              child: Column(
                                children: [
                                  widget.child,
                                  if (bottomSheet != null)
                                    VisibilityDetector(
                                      key: const Key('bottom-sheet'),
                                      onVisibilityChanged: (visibilityInfo) {
                                        if (visibilityInfo.visibleFraction <=
                                            0.6) {
                                          if (mounted &&
                                              _bottomSheetVisible == false) {
                                            setState(() {
                                              _bottomSheetVisible = true;
                                            });
                                          }
                                        } else {
                                          if (mounted &&
                                              _bottomSheetVisible == true) {
                                            setState(() {
                                              _bottomSheetVisible = false;
                                            });
                                          }
                                        }
                                      },
                                      child: Opacity(
                                        opacity: _bottomSheetVisible == true
                                            ? 0.0
                                            : 1.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 20.0,
                                          ),
                                          child: bottomSheet,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: kToolbarHeight,
                  child: Row(
                    spacing: 8.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (appBarLeading != null)
                        appBarLeading
                      else
                        const SizedBox(),
                      if (appBarTitle != null)
                        Expanded(child: appBarTitle)
                      else
                        const SizedBox(),
                      if (appBarTrailing != null)
                        appBarTrailing
                      else
                        const SizedBox(),
                    ],
                  ),
                ),
                if (overlayItem != null)
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.paddingOf(context).top + 20.0,
                    ),
                    child: MeasureSize(
                      onChange: (size) {
                        setState(() {
                          _overlayItemHeight = size?.height ?? 0.0;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          overlayItem,
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
