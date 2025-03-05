import 'package:flutter/material.dart';

class AdaptativeHorizontalList<T> extends StatefulWidget {
  const AdaptativeHorizontalList({
    required this.itemBuilder,
    required this.screenWidth,
    this.items = const [],
    this.minCardWidth = 220,
    this.height,
    this.showArrowButtons = true,
    this.selected,
    this.aspectRatio,
    this.spacing = 20.0,
    this.numberOfRows = 1,
    super.key,
  });

  final double screenWidth;
  final List<T> items;
  final Widget Function(T object, double height) itemBuilder;
  final double minCardWidth;
  final double? height;
  final bool showArrowButtons;
  final T? selected;
  final double? aspectRatio;
  final double spacing;
  final int numberOfRows;

  @override
  State<AdaptativeHorizontalList<T>> createState() =>
      _AdaptativeHorizontalListState<T>();
}

class _AdaptativeHorizontalListState<T>
    extends State<AdaptativeHorizontalList<T>> {
  late PageController _pageController;
  int currentPage = 0;
  double pixels = 0;
  double maxScrollExtent = 0;
  int cardCountOnScreen = 0;

  @override
  void initState() {
    super.initState();
    _setCardCountOnScreen();
    _pageController.addListener(_updateValues);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.selected != null) {
        _scrollToSelected();
      }
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateValues);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AdaptativeHorizontalList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_pageController.hasClients) {
      maxScrollExtent = _pageController.position.maxScrollExtent;
    }
    final cards = _getCardCountOnScreen(
      screenWidth: screenSize,
      minCardWidth: widget.minCardWidth,
      mainAxisSpacing: 20.0,
    );
    if (cards != cardCountOnScreen) {
      _setCardCountOnScreen();
    }
    _pageController.removeListener(_updateValues);
    _pageController.addListener(_updateValues);

    if (widget.selected != oldWidget.selected) {
      _scrollToSelected();
    }
  }

  void _scrollToSelected() {
    final selected = widget.selected;
    if (selected != null) {
      int selectedIndex = widget.items.indexOf(selected);
      if (selectedIndex != -1) {
        final cardsCountOnScreen = _getCardCountOnScreen(
          screenWidth: screenSize,
          minCardWidth: minCardWidth,
          mainAxisSpacing: 20.0,
        );
        if (selectedIndex > (cardsCountOnScreen - 1)) {
          _pageController
              .jumpToPage(selectedIndex - (cardsCountOnScreen ~/ 2.1));
        }
      }
    }
  }

  double get screenSize => widget.screenWidth - 0.0;

  double get width => _getCardWidthBasedOnScreen(
        screenWidth: screenSize,
        minCardWidth: minCardWidth,
        mainAxisSpacing: 0.0,
      );

  double get height =>
      widget.height ??
      (width - widget.spacing) * (widget.aspectRatio ?? 16 / 9);

  double get minCardWidth =>
      widget.minCardWidth > screenSize ? screenSize : widget.minCardWidth;

  void _setCardCountOnScreen() {
    cardCountOnScreen = _getCardCountOnScreen(
      screenWidth: screenSize,
      minCardWidth: minCardWidth,
      mainAxisSpacing: 20.0,
    );
    _pageController = PageController(
      viewportFraction: 0.85 / cardCountOnScreen,
    );
  }

  int _getCardCountOnScreen({
    required double screenWidth,
    required double minCardWidth,
    required double mainAxisSpacing,
  }) {
    return (screenWidth / minCardWidth).floor();
  }

  double _getCardWidthBasedOnScreen({
    required double screenWidth,
    required double minCardWidth,
    required double mainAxisSpacing,
  }) {
    int maxCardCount = _getCardCountOnScreen(
      screenWidth: screenWidth,
      minCardWidth: minCardWidth,
      mainAxisSpacing: mainAxisSpacing,
    );
    double cardWidth =
        (screenWidth - (maxCardCount * mainAxisSpacing)) / maxCardCount;

    return cardWidth * 0.85;
  }

  void _updateValues() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentPage = _pageController.page?.toInt() ?? 0;
        pixels = _pageController.position.pixels;
        maxScrollExtent = _pageController.position.maxScrollExtent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: height * widget.numberOfRows,
                  child: Row(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _pageController,
                          physics: const PageScrollPhysics(
                            parent: ClampingScrollPhysics(),
                          ),
                          padding: EdgeInsets.only(right: widget.spacing),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: widget.spacing),
                              child: widget.itemBuilder(
                                widget.items[index],
                                height,
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio: 1.0,
                                  maxCrossAxisExtent: height,
                                  mainAxisExtent: width,
                                  crossAxisSpacing: widget.spacing,
                                  mainAxisSpacing: 0.0),
                          itemCount: widget.items.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
