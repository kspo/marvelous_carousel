library marvelous_carousel;

import 'dart:math';

import 'package:flutter/material.dart';

/// A widget for creating a vertical/horizontal carousel with stacked cards.

/// Select a [PagerType] from enum [PagerType.simple] or [PagerType.stack]
/// [PagerType.simple] makes an animation that makes an simple effect
/// [PagerType.stack] makes an animation that makes an stacked animation
///
enum PagerType { simple, stack }

class MarvelousCarousel extends StatefulWidget {
  /// [viewportFraction] is initial viewport rates between items..
  final double viewportFraction;

  /// [scaleX] property sets rotation y axis between items on change
  final double scaleX;

  /// [scaleY] property sets scale y axis between items on change
  final double scaleY;

  /// [rotationX] property sets rotation x axis between items on change..
  final double rotationX;

  /// [rotationY] property sets rotation y axis between items on change..
  final double rotationY;

  /// [opacity] property sets opcity between items on change..
  final double opacity;

  /// Input your cards in [children].
  final List<Widget> children;

  /// [onPageChanged] listen to page index changes.
  final ValueChanged<int>? onPageChanged;

  /// [pageSnapping] snaps children on change..
  final bool pageSnapping;

  /// [reverse] sets carousel right to left..
  final bool reverse;

  /// [physics] default flutter physics you can set..
  final ScrollPhysics physics;

  /// [scrollDirection] enables you to selecet axis horizontal or vertical..
  final Axis scrollDirection;

  /// Select a [PagerType] from enum [PagerType.simple] or [PagerType.stack]
  final PagerType pagerType;

  /// [overscroll] is used to select animation rate when overscrolling
  final double overscroll;

  /// [dotsVisible] default true. It's mean bottom dots marks are visible
  final bool dotsVisible;

  /// [dotsBottom] is used to set position from bottom
  final double dotsBottom;

  /// [margin] is horizontal space between items.
  final double margin;

  const MarvelousCarousel({
    required this.children,
    this.physics = const BouncingScrollPhysics(),
    this.onPageChanged,
    this.pageSnapping = true,
    this.viewportFraction = 0.85,
    this.scaleX = 1,
    this.scaleY = 1,
    this.opacity = 1,
    this.rotationX = 0,
    this.rotationY = 0,
    this.scrollDirection = Axis.horizontal,
    this.pagerType = PagerType.simple,
    this.dotsVisible = true,
    this.dotsBottom = 20.0,
    this.reverse = false,
    this.overscroll = 0,
    this.margin = 0,
    Key? key,
  })  : assert(scaleX <= 1 && scaleX >= 0),
        super(key: key);

  factory MarvelousCarousel.symmetric({
    required List<Widget> children,
    ValueChanged<int>? onPageChanged,
    ScrollPhysics physics = const BouncingScrollPhysics(),
    bool pageSnapping = true,
    double viewportFraction = 0.75,
    double scale = 0.75,
    double opacity = 1,
    double rotation = 0,
    Axis direction = Axis.horizontal,
    PagerType pagerType = PagerType.simple,
    bool reverse = false,
    bool dotsVisible = true,
    double dotsBottom = 30.0,
    double overscroll = 0,
    double margin = 0,
    Key? key,
  }) {
    return MarvelousCarousel(
      pageSnapping: pageSnapping,
      physics: physics,
      viewportFraction: viewportFraction,
      onPageChanged: onPageChanged,
      opacity: opacity,
      scaleX: scale,
      scaleY: scale,
      rotationX: rotation,
      rotationY: rotation,
      scrollDirection: direction,
      pagerType: pagerType,
      reverse: reverse,
      dotsVisible: dotsVisible,
      dotsBottom: dotsBottom,
      overscroll: overscroll,
      key: key,
      children: children,
    );
  }

  @override
  MarvelousCarouselState createState() => MarvelousCarouselState();
}

class MarvelousCarouselState extends State<MarvelousCarousel> {
  late PageController _pageController;
  double currentPageValue = 0;
  late Size screenSize;
  Size pagerSize = const Size(0, 0);
  GlobalKey? _pagerKey;

  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.pagerType == PagerType.stack) {
      _pageController = PageController(viewportFraction: 1);
    } else {
      _pageController =
          PageController(viewportFraction: widget.viewportFraction);
    }
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
        activeIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        pagerSize = constraints.biggest;
        return Stack(
          children: [
            PageView.builder(
              key: _pagerKey,
              itemCount: widget.children.length,
              pageSnapping: widget.pageSnapping,
              onPageChanged: widget.onPageChanged,
              physics: widget.physics,
              controller: _pageController,
              scrollDirection: widget.scrollDirection,
              reverse: widget.reverse,
              itemBuilder: (context, index) {
                var position = index - currentPageValue;
                var scaleXValue = max(
                    1 - ((position * (1 - widget.scaleX)).abs()),
                    widget.scaleX);
                var scaleYValue = max(
                    1 - ((position * (1 - widget.scaleY)).abs()),
                    widget.scaleY);
                var rotationXValue = (pi / 180) *
                    min(((position * (widget.rotationX)).abs()),
                        widget.rotationX);
                var rotationYValue = (pi / 180) *
                    min(((position * (widget.rotationY)).abs()),
                        widget.rotationY);
                var opacityValue = max(
                    1 - ((position * (1 - widget.opacity)).abs()),
                    widget.opacity);
                if (widget.pagerType == PagerType.simple) {
                  if (position == 0) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: widget.margin),
                        child: widget.children[index]);
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: widget.margin),
                      child: Opacity(
                        opacity: opacityValue,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..scale(scaleXValue, scaleYValue)
                            ..rotateY(rotationYValue)
                            ..rotateX(rotationXValue),
                          alignment: const Alignment(0, 0),
                          child: widget.children[index],
                        ),
                      ),
                    );
                  }
                } else if (PagerType.stack == widget.pagerType) {
                  if (index == currentPageValue.floor()) {
                    var opacityValue = max(
                        1 - ((position * (1 - widget.opacity)).abs()),
                        widget.opacity);
                    var scaleXValue = (widget.scaleX +
                        (1 - widget.scaleX) * (1 - (position.abs())));
                    var scaleYValue = (widget.scaleY +
                        (1 - widget.scaleY) * (1 - (position.abs())));
                    var transitionX = widget.scrollDirection == Axis.horizontal
                        ? (widget.reverse
                            ? ((index - currentPageValue) *
                                ((pagerSize.width +
                                    ((pagerSize.width * (1 - scaleXValue)) *
                                        2) +
                                    widget.overscroll)))
                            : ((currentPageValue - index) *
                                ((pagerSize.width -
                                    ((pagerSize.width * (1 - scaleXValue)) *
                                        2) +
                                    widget.overscroll))))
                        : 0.0;
                    var transitionY = widget.scrollDirection == Axis.vertical
                        ? (widget.reverse
                            ? ((index - currentPageValue) *
                                ((pagerSize.height +
                                    ((pagerSize.height * (1 - scaleXValue)) *
                                        2) +
                                    widget.overscroll)))
                            : ((currentPageValue - index) *
                                ((pagerSize.height -
                                    ((pagerSize.height * (1 - scaleXValue)) *
                                        2) +
                                    widget.overscroll))))
                        : 0.0;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: widget.margin),
                      child: Opacity(
                        opacity: opacityValue,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..scale(scaleXValue, scaleYValue)
                            ..rotateY(rotationYValue)
                            ..rotateX(rotationXValue)
                            ..translate(transitionX, transitionY),
                          alignment: const Alignment(0, 0),
                          child: widget.children[index],
                        ),
                      ),
                    );
                  } else if (index == currentPageValue.floor() + 1) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: widget.margin),
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0),
                        alignment: const Alignment(0, 1),
                        child: widget.children[index],
                      ),
                    );
                  } else {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: widget.margin),
                        child: widget.children[index]);
                  }
                } else {
                  return throw Exception(
                      "pagertype is wrong you set, please set PagerType.simple or PagerType.stack");
                }
              },
            ),
            widget.dotsVisible
                ? Positioned(
                    bottom: widget.dotsBottom,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: widget.children
                          .asMap()
                          .map((index, item) => MapEntry(
                                index,
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin: EdgeInsets.only(
                                      right: 10, left: index == 0 ? 10 : 0),
                                  width: activeIndex == index ? 25 : 15,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: activeIndex == index
                                        ? Colors.amber
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ))
                          .values
                          .toList(),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
