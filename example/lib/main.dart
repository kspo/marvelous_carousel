import 'package:flutter/material.dart';
import 'package:stackslider/stackslider.dart';

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
    "Reverse Carousel",
    "Rotational Carousel",
    "Variable Scale Carousel",
    "Opacity Carousel",
    "Stack Slider ",
    "Reverse Stack Slider Carousel",
    "Overscroll Stack Slider",
    "Gallery Slider",
    "Walk Through Slider",
  ];

  @override
  void initState() {
    super.initState();
    _widgets.addAll([
      getSimpleCrousel(),
      getReverseCrousel(),
      getRotationalCrousel(),
      getVariableScaleCrousel(),
      getOpacityCrousel(),
      getStackSlider(),
      getReverseStackSlider(),
      getOverScrollStackSlider(),
      getGallerySlider(),
      const WalkThroughSliderExample(),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        body: Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: 566,
                            child: _widgets[index],
                          ),
                        ),
                      );
                    }));
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

  Widget getSimpleCrousel() {
    return StackSlider(
      scrollDirection: Axis.horizontal,
      margin: 10,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getReverseCrousel() {
    return StackSlider(
      reverse: true,
      margin: 10,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getRotationalCrousel() {
    return StackSlider(
      rotationY: 60,
      margin: 10,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getVariableScaleCrousel() {
    return StackSlider(
      scaleX: 0.8,
      scaleY: 0.4,
      margin: 10,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getOpacityCrousel() {
    return StackSlider(
      opacity: 0.4,
      margin: 10,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getStackSlider() {
    return StackSlider(
      pagerType: PagerType.stack,
      scrollDirection: Axis.vertical,
      margin: 10,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getReverseStackSlider() {
    return StackSlider(
      reverse: true,
      pagerType: PagerType.stack,
      scrollDirection: Axis.horizontal,
      margin: 10,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getOverScrollStackSlider() {
    return StackSlider(
      overscroll: -300,
      margin: 10,
      pagerType: PagerType.stack,
      dotsVisible: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getGallerySlider() {
    return StackSlider(
      opacity: 0.2,
      scaleX: 0.5,
      scaleY: 0.5,
      overscroll: 0,
      margin: 10,
      reverse: true,
      pagerType: PagerType.stack,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel2.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel3.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel4.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 566,
              width: 382,
              child: Image.asset(
                "images/marvel5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WalkThroughSliderExample extends StatefulWidget {
  const WalkThroughSliderExample({super.key});

  @override
  _WalkThroughSliderExampleState createState() =>
      _WalkThroughSliderExampleState();
}

class _WalkThroughSliderExampleState extends State<WalkThroughSliderExample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StackSlider(
            pagerType: PagerType.stack,
            overscroll: -200,
            margin: 10,
            opacity: 0.2,
            dotsVisible: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 566,
                    width: 382,
                    child: Image.asset(
                      "images/marvel1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 566,
                    width: 382,
                    child: Image.asset(
                      "images/marvel2.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 566,
                    width: 382,
                    child: Image.asset(
                      "images/marvel3.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 566,
                    width: 382,
                    child: Image.asset(
                      "images/marvel4.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: 566,
                    width: 382,
                    child: Image.asset(
                      "images/marvel5.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Text(
            "Page ${selectedIndex + 1}",
          ),
        ),
      ],
    );
  }
}

final Movie testMovie = Movie(
  bannerUrl: 'images/banner.webp',
  posterUrl: 'images/bannerprofile.jpeg',
  title: 'Marvelous Slider',
  categories: ['Simple', 'Easy', 'Ready to Use'],
);
