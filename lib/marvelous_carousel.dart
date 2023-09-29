library marvelous_carousel;

import 'dart:math';

import 'package:flutter/material.dart';

class MarvelousCarousel extends StatefulWidget {
  final double viewportFraction;
  final double scaleX;
  final double scaleY;
  final double rotationX;
  final double rotationY;
  final double opacity;
  final List<Widget> children;
  final ValueChanged<int>? onPageChanged;
  final bool pageSnapping;
  final bool reverse;
  final ScrollPhysics physics;
  final Axis scrollDirection;
  final PagerType pagerType;
  final double overscroll;
  final bool dotsVisible;
  final double dotsBottomPx;
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
    this.dotsBottomPx = 30.0,
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
    double dotsBottomPx = 30.0,
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
      dotsBottomPx: dotsBottomPx,
      overscroll: overscroll,
      key: key,
      children: children,
    );
  }

  @override
  _MarvelousCarouselState createState() => _MarvelousCarouselState();
}

enum PagerType { simple, stack }

class _MarvelousCarouselState extends State<MarvelousCarousel> {
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
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          pagerSize = constraints.biggest;
          return Stack(
            children: [
              PageView.builder(
                key: _pagerKey,
                itemCount: widget.children.length,
                pageSnapping: widget.pageSnapping,
                onPageChanged: (int i) {
                  activeIndex = i;
                  widget.onPageChanged;
                },
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
                          margin:
                              EdgeInsets.symmetric(horizontal: widget.margin),
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
                      var transitionX = widget.scrollDirection ==
                              Axis.horizontal
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
                              ..scale(scaleXValue ?? 0, scaleYValue ?? 0)
                              ..rotateY(rotationYValue ?? 0)
                              ..rotateX(rotationXValue ?? 0)
                              ..translate(transitionX ?? 0, transitionY ?? 0),
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
                          margin:
                              EdgeInsets.symmetric(horizontal: widget.margin),
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
                      bottom: widget.dotsBottomPx,
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
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: activeIndex == index
                                          ? Theme.of(context).primaryColor
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
      ),
    );
  }
}