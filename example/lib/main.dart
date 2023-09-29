import 'package:flutter/material.dart';
import 'package:marvelous_carousel/marvelous_carousel.dart';

import 'arc_banner.dart';

void main() => runApp(const EntryWidget());

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finite Coverflow Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final List<Widget> _widgets = [];
  late final List<String> _widgetsTiles = [
    "Simple Carousel",
    "Simple Reverse Carousel",
    "Carousel With Rotation",
    "Scale Items On Change",
    "Opacity Animation On Change",
    "Stack Carousel",
    "Overscroll Stack Carousel",
    "Mixed Animation",
    "Walk Through Slider",
  ];

  @override
  void initState() {
    super.initState();
    _widgets.addAll([
      SimpleCarousel(
        isReverse: false,
      ),
      SimpleCarousel(
        isReverse: true,
      ),
      const CarouselWithRotation(),
      const ScaleItemsOnChange(),
      const OpacityAnimationOnChange(),
      const StackCarousel(),
      const OverscrollStackCarousel(),
      const MixedAnimation(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            MovieDetailHeader(testMovie),
            Card(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                ),
                shrinkWrap: true,
                itemCount: _widgets.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _widgetsTiles[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return _widgets[index];
                        },
                      ),
                    );
                  },
                ),
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPage(int index, double position) {
    return Card(
      child: Center(
        child: Text("$index"),
      ),
    );
  }
}

class MixedAnimation extends StatelessWidget {
  const MixedAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Mixed Animation"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            opacity: 0.2,
            scaleX: 0.5,
            scaleY: 0.5,
            overscroll: 0,
            margin: 10,
            reverse: true,
            pagerType: PagerType.stack,
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class OverscrollStackCarousel extends StatelessWidget {
  const OverscrollStackCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Overscroll Stack Animation"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            overscroll: -300,
            opacity: 0,
            margin: 20,
            pagerType: PagerType.stack,
            dotsVisible: true,
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class StackCarousel extends StatefulWidget {
  const StackCarousel({
    super.key,
  });

  @override
  State<StackCarousel> createState() => _StackCarouselState();
}

class _StackCarouselState extends State<StackCarousel> {
  bool _isVertical = true;
  bool _isReverse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Vertical",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Switch(
                value: _isVertical,
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  setState(() {
                    _isVertical = value;
                  });
                },
              ),
              Container(
                color: Colors.grey,
                width: 1,
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Reverse",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Switch(
                value: _isReverse,
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  setState(() {
                    _isReverse = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Stack Carousel"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            pagerType: PagerType.stack,
            margin: 15,
            reverse: _isReverse,
            scrollDirection: _isVertical ? Axis.vertical : Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class OpacityAnimationOnChange extends StatelessWidget {
  const OpacityAnimationOnChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Opacity Animation On Change"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            opacity: 0.25,
            margin: 10,
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ScaleItemsOnChange extends StatelessWidget {
  const ScaleItemsOnChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Scale Items On Change"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            scaleX: 0.8,
            scaleY: 0.4,
            margin: 10,
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CarouselWithRotation extends StatelessWidget {
  const CarouselWithRotation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Carousel With Rotation"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            rotationY: 60,
            margin: 0,
            scrollDirection: Axis.horizontal,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class SimpleCarousel extends StatefulWidget {
  bool isReverse;
  SimpleCarousel({
    super.key,
    required this.isReverse,
  });

  @override
  State<SimpleCarousel> createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Reverse",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              Switch(
                value: widget.isReverse,
                thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
                onChanged: (bool value) {
                  setState(() {
                    widget.isReverse = value;
                  });
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Simple${widget.isReverse ? " Reverse " : " "}Carousel"),
      ),
      body: Center(
        child: SizedBox(
          height: 566,
          child: MarvelousCarousel(
            scrollDirection: Axis.horizontal,
            reverse: widget.isReverse,
            margin: 10,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: 566,
                        width: 382,
                        child: Image.asset(
                          "images/marvel$e.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

final Movie testMovie = Movie(
  bannerUrl: 'images/banner.webp',
  posterUrl: 'images/bannerprofile.jpeg',
  title: 'Marvelous Slider',
  categories: ['Simple', 'Easy', 'Ready to Use'],
);
