import 'package:flutter/material.dart';

class AdaptativeHorizontalList<T> extends StatefulWidget {
  const AdaptativeHorizontalList({
    required this.item,
    this.screenWidth,
    this.items = const [],
    this.minCardWidth = 220,
    this.height,
    this.isLoading = false,
    this.showNextCardPiece = false,
    this.showArrowButtons = true,
    this.showPaginationBullets = false,
    this.spacing = 16.0,
    this.selected,
    this.aspectRatio,
    super.key,
  });

  final double? screenWidth;
  final List<T> items;
  final Widget Function(T object, double height) item;
  final double minCardWidth;
  final double? height;
  final bool isLoading;
  final bool showNextCardPiece;
  final bool showArrowButtons;
  final bool showPaginationBullets;
  final double spacing;
  final T? selected;
  final double? aspectRatio;

  @override
  State<AdaptativeHorizontalList<T>> createState() =>
      _AdaptativeHorizontalListState<T>();
}

class _AdaptativeHorizontalListState<T>
    extends State<AdaptativeHorizontalList<T>> {
  late PageController _pageController;
  int _currentPage = 0;
  double _pixels = 0;
  double _maxScrollExtent = 0;
  int _cardCountOnScreen = 0;

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
      _maxScrollExtent = _pageController.position.maxScrollExtent;
    }
    final cards = _getCardCountOnScreen(
      screenWidth: screenSize,
      minCardWidth: widget.minCardWidth,
      mainAxisSpacing: 16.0,
    );
    if (cards != _cardCountOnScreen) {
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
          mainAxisSpacing: widget.spacing,
        );
        if (selectedIndex > (cardsCountOnScreen - 1)) {
          _pageController
              .jumpToPage(selectedIndex - (cardsCountOnScreen ~/ 2.1));
        }
      }
    }
  }

  double get screenSize =>
      (widget.screenWidth ?? MediaQuery.of(context).size.width) -
      (widget.showNextCardPiece ? 0.0 : 48.0);

  double get width => _getCardWidthBasedOnScreen(
        screenWidth: screenSize,
        minCardWidth: minCardWidth,
        mainAxisSpacing: widget.showArrowButtons ? 0.0 : -48.0,
      );

  double get height => widget.height ?? width * (widget.aspectRatio ?? 16 / 9);

  double get minCardWidth =>
      widget.minCardWidth > screenSize ? screenSize : widget.minCardWidth;

  bool get showLeftButton =>
      _currentPage > 0 && !widget.showNextCardPiece && widget.showArrowButtons;

  bool get showRightButton {
    if (_maxScrollExtent == 0) {
      return _cardCountOnScreen < widget.items.length &&
          !widget.showNextCardPiece &&
          widget.showArrowButtons;
    } else {
      return _pixels < _maxScrollExtent &&
          !widget.showNextCardPiece &&
          widget.showArrowButtons;
    }
  }

  void _setCardCountOnScreen() {
    _cardCountOnScreen = _getCardCountOnScreen(
      screenWidth: screenSize,
      minCardWidth: minCardWidth,
      mainAxisSpacing: 16.0,
    );
    _pageController = PageController(
      viewportFraction:
          (widget.showNextCardPiece ? 0.85 : 1.0) / _cardCountOnScreen,
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

    return cardWidth * (widget.showNextCardPiece ? 0.85 : 1.0);
  }

  void _updateValues() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _currentPage = _pageController.page?.toInt() ?? 0;
        _pixels = _pageController.position.pixels;
        _maxScrollExtent = _pageController.position.maxScrollExtent;
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
                  height: height,
                  child: Row(
                    children: [
                      if (!widget.showNextCardPiece)
                        SizedBox(
                          width: widget.showArrowButtons ? 24.0 : 0.0,
                        ),
                      Expanded(
                        child: GridView.builder(
                          controller: _pageController,
                          physics: const PageScrollPhysics(
                            parent: ClampingScrollPhysics(),
                          ),
                          padding: EdgeInsets.only(
                            top: 16.0,
                            bottom: 16.0,
                            right:
                                widget.showNextCardPiece ? widget.spacing : 0.0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: widget.showNextCardPiece
                                  ? EdgeInsets.only(left: widget.spacing)
                                  : EdgeInsets.symmetric(
                                      horizontal: widget.showArrowButtons
                                          ? widget.spacing / 2
                                          : widget.spacing,
                                    ),
                              child: widget.item(widget.items[index], height),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 1.0,
                            maxCrossAxisExtent: height,
                            mainAxisExtent: width,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 0.0,
                          ),
                          itemCount: widget.items.length,
                        ),
                      ),
                      if (!widget.showNextCardPiece)
                        SizedBox(
                          width: widget.showArrowButtons ? 24.0 : 0.0,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.showPaginationBullets)
              SizedBox(
                height: 8.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.items.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        width: _currentPage == index ? 12.0 : 6.0,
                        height: _currentPage == index ? 12.0 : 6.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 4,
      ),
      child: Icon(
        icon,
        size: 20,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
