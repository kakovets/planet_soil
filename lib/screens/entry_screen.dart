import 'dart:math';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:planet_soil/models/continent.dart';
import 'package:planet_soil/providers/continents_provider.dart';
import 'package:planet_soil/providers/theme_provider.dart';
import 'package:planet_soil/widgets/continent_card.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../theme/theme.dart';
import '../widgets/bottomSheets/continent_sheet.dart';
import '../widgets/custom_ink_well.dart';
import '../widgets/o3d_card.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final O3DController o3dController = O3DController();
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.viewportFraction = .6; // Source code edition!
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ContinentsProvider, ThemeProvider>(
      builder: (context, continentsProvider, themeProvider, _) {
        ThemeData myTheme = themeProvider.themeData;
        var continentsList = continentsProvider.continentList;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(animation),
                    child: child,
                  ),
                );
              },
              child: CustomInkWell(
                key: ValueKey<bool>(myTheme==darkMode),
                tap: () {
                  context.read<ThemeProvider>().toggleTheme(); // context.read
                },
                longPress: () async {
                  try {
                    if (pageController.page!.toInt() > 2) {
                      await pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.ease,
                      );
                    }
                  } catch (e) {
                    debugPrint('$e');
                  }
                  continentsProvider.populate1984();
                },
                splashColor: Colors.grey.withOpacity(0.3),
                pathToIcon: myTheme == darkMode
                    ?
                'assets/icons/day.svg'
                    :
                'assets/icons/night.svg',
              ),
            ),
            actions: [
              CustomInkWell(
                tap: () {
                  continentsProvider.add(
                    Continent(
                      name: 'Default',
                      pathToImage: 'assets/continents/default.jpg',
                      area: 1000,
                      population: 12345,
                    ),
                  );
                },
                longPress: () async {
                  try {
                    if (pageController.page!.toInt() > 4) {
                      await pageController.animateToPage(
                        4,
                        duration: const Duration(milliseconds: 1),
                        curve: Curves.ease,
                      );
                    }
                  } catch (e) {
                    debugPrint('$e');
                  }
                  continentsProvider.populateReal();
                },
                splashColor: Colors.blue.shade100,
                pathToIcon: 'assets/icons/add_location.svg',
              ),
            ],
            title: SmoothPageIndicator(
              controller: pageController,
              count:  continentsList.length,
              effect: ScrollingDotsEffect(
                maxVisibleDots: calcDots(),
                dotColor: Theme.of(context).extension<MyColors>()!
                    .dotColor,
                activeDotColor: Theme.of(context).extension<MyColors>()!
                    .activeDotColor,
              ),
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      try {
                        Continent continent = continentsProvider
                            .continentList[index];
                        rotateEarth(continent.name);
                      } catch (e) {
                        debugPrint('$e');
                      }
                    },
                    children: continentsList.map((cont) =>
                        ContinentCard(
                          name: cont.name,
                          pathToImage: cont.pathToImage,
                        ),
                    ).toList(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: O3dCard(
                    func: () {
                      double theta = Random().nextDouble() * 360;
                      double phi = Random().nextDouble() * 180;
                      o3dController.cameraOrbit(theta, phi, 10000);
                    },
                    o3d: O3D(
                      interactionPrompt: InteractionPrompt.none,
                      cameraControls: true,
                      cameraOrbit: CameraOrbit(250, 45, 10000),
                      disableTap: true,
                      controller: o3dController,
                      src: 'assets/3d/Earth.glb',
                      autoPlay: false,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    try {
                      Continent continent = continentsProvider
                          .continentList[pageController.page!.toInt()];
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return ContinentSheet(continent: continent,);
                        },
                      );
                    } catch (e) {
                      debugPrint('$e');
                    }
                  },
                  child: const Text(
                    'Learn more',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void rotateEarth(String contName) {
    switch (contName) {
      case 'Eurasia': o3dController.cameraOrbit(250, 45, 10000);
      case 'N America': o3dController.cameraOrbit(80, 45, 10000);
      case 'S America': o3dController.cameraOrbit(120, 110, 10000);
      case 'Africa': o3dController.cameraOrbit(200, 90, 10000);
      case 'Australia': o3dController.cameraOrbit(315, 120, 10000);
      case 'Oceania': o3dController.cameraOrbit(80, 45, 10000);
      case 'Eastasia': o3dController.cameraOrbit(280, 65, 10000);
      default: {
        double theta = Random().nextDouble() * 360;
        double phi = Random().nextDouble() * 180;
        o3dController.cameraOrbit(theta, phi, 10000);
      }
    }
  }

  int calcDots() {
    int dots = (MediaQuery.of(context).size.width - 100) ~/ 26;
    if (dots.isEven) dots--;
    return dots;
  }

}