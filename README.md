# This is Marvelous Carousel

Marvelous Carousel is a widget that allows you to horizontally or vertically scroll through multiple images or items. It is commonly used in applications where users need to browse a collection of images or rotate through content. For example, you can use Carousel for a product gallery, a news feed, or an event calendar.

![Static Badge](https://img.shields.io/badge/Author-KSPoyraz-blue)
[![Linkedin: Kspoyraz](https://img.shields.io/badge/Kspoyraz-blue?logo=Linkedin&logoColor=fff)][linkedin]
[![Github: Kspo](https://img.shields.io/badge/Kspo-white?logo=Github&logoColor=000)][github]
![GitHub Licence](https://img.shields.io/github/license/kspo/apple_stocks_app_clone?label=Licence)
![GitHub last commit](https://img.shields.io/github/last-commit/kspo/apple_stocks_app_clone?label=Last+Commit)


## 📸 Screenshots
|Main Screen|
|---|
|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/main.png" style="width:300px"/>|
 
 ### Example Screenshots
|Simple|Rotation|Scale Items|
|----|----|----|
|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/simple.gif" style="width:300px"/>|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/rotation.gif" style="width:300px"/>|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/scale.gif" style="width:300px"/>|

|Opacity Animation|Stack|Overscroll|
|----|----|----|
|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/opacity.gif" style="width:300px"/>|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/stack.gif" style="width:300px"/>|<img src="https://raw.githubusercontent.com/kspo/marvelous_carousel/main/screenshots/overscroll.gif" style="width:300px"/>|

## Marvelous Crousel Property List

Here are the details of all attributes:

| Attribute Name   | Description                                                           | Applicable Type |
|:-----------------|:----------------------------------------------------------------------|:----------------|
| pagerType        | Set the MarvelousSlider type, i.e., PagerType.Carousel & PagerType.Stack  | -               |
| reverse          | Reverse the order if set to true                                      | Both            |
| scrollDirection  | Scroll direction of your pager, i.e., Axis.Horizontal & Axis.Vertical | Both            |
| viewPortFraction | Set the view port fraction                                            | Carousel        |
| pageSnapping     | Snap to the selected or current page                                  | Both            |
| physics          | Define ScrollPhysics, affecting scrolling velocity, etc.              | Both            |
| onPageChanged    | Callback that returns the current index whenever an item is selected  | Both            |
| scaleX           | Minimum x-scale of unselected page                                    | Both            |
| scaleY           | Minimum y-scale of unselected page                                    | Both            |
| opacity          | Set opacity of unselected page                                        | Both            |
| rotationX        | Maximum x-rotation of unselected page                                 | Carousel        |
| rotationY        | Maximum y-rotation of unselected page                                 | Carousel        |
| overscroll       | Apply overscroll effect to the last item                              | Stack           |
| key              | Set a key for the pager                                               | Both            |
| children         | List of child widgets to add to the pager                             | -               |
| dotsVisible      | set true if you want to see dots                                      | -               |

## MIT License

Copyright (c) 2023 Kazım Selman Poyraz


[linkedin]: https://www.linkedin.com/in/kaz%C4%B1m-selman-poyraz-0048b7143/
[github]: https://github.com/kspo

[pull_down_button]: https://pub.dev/packages/pull_down_button#pulldownbuttontheme
[marqueer]: https://pub.dev/packages/marqueer
[chart_sparkline]: https://pub.dev/packages/chart_sparkline