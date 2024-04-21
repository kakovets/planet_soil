import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:o3d/o3d.dart';
import 'package:planet_soil/core/theme/theme_provider.dart';
import 'package:planet_soil/features/regions/screens/text_form_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/theme/theme.dart';
import '../bloc/regions_bloc.dart';
import '../models/region_model.dart';
import '../widgets/bottomSheets/region_sheet.dart';
import '../widgets/custom_animated_switcher.dart';
import '../widgets/custom_ink_well.dart';
import '../widgets/o3d_card.dart';
import '../widgets/region_page_card.dart';
import 'no_connection_screen.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({super.key});

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {

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
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        ThemeData myTheme = themeProvider.themeData;
        return BlocBuilder<RegionBloc, RegionState>(
          builder: (context, state) {
            switch (state.status) {
              case RegionStatus.failure:
                return NoConnectionScreen(
                    callback: context.read<RegionBloc>().add, // Ok?
                );
              case RegionStatus.success:
                List<RegionModel> regions = state.regions;
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    leading: CustomAnimatedSwitcher(
                      child: CustomInkWell(
                        key: ValueKey<bool>(myTheme == darkMode),
                        tap: () {
                          var rand = Random().nextInt(3);
                          switch (rand) {
                            case 0: {
                              context.read<ThemeProvider>().toggleTheme();
                            }
                            case 1: {
                              themeProvider.toggleTheme();
                            }
                            case 2: {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme();
                            }
                            default: themeProvider.toggleTheme();
                          }
                        },
                        splashColor: Colors.grey.withOpacity(0.3),
                        pathToIcon: myTheme == darkMode
                            ?
                        'assets/icons/day.svg'
                            :
                        'assets/icons/night.svg',
                        longPress: (){
                          var theme = myTheme == darkMode ? 'Dark' : 'Light';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Current theme is $theme',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                    title: SmoothPageIndicator(
                      controller: pageController,
                      count: regions.length,
                      effect: ScrollingDotsEffect(
                        maxVisibleDots: calcDots(),
                        dotColor: Theme.of(context).extension<MyColors>()!
                            .dotColor,
                        activeDotColor: Theme.of(context).extension<
                            MyColors>()!
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
                    actions: [
                      CustomInkWell(
                        tap: () {
                          context.read<RegionBloc>().add(RegionFetched());
                        },
                        longPress: () {},
                        pathToIcon: 'assets/icons/refresh.svg',
                        splashColor: Colors.blue,
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: PageView(
                            controller: pageController,
                            children: regions.map((cont) {
                              var imgName = cont.name
                                  .replaceAll(' ', '-')
                                  .toLowerCase();
                              return RegionCard(
                                name: cont.name,
                                pathToImage: 'assets/region_page_cards/$imgName.jpg',
                              );
                            }).toList(),
                            onPageChanged: (index) {
                              var orbit = calcOrbit(regions[index]);
                              o3dController.cameraOrbit(
                                orbit.theta,
                                orbit.phi,
                                2000,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: O3dCard(
                            func: () {
                              double theta = Random().nextDouble() * 360;
                              double phi = Random().nextDouble() * 180;
                              o3dController.cameraOrbit(theta, phi, 10000);
                            },
                            o3d: O3D(
                              disablePan: true,
                              interactionPrompt: InteractionPrompt.none,
                              cameraControls: true,
                              cameraOrbit: calcOrbit(regions.first),
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
                              RegionModel region =
                              regions[pageController.page!.toInt()];
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return RegionSheet(
                                    region: region,
                                  );
                                },
                              );
                            } catch (e) {
                              debugPrint('$e');
                            }
                          },
                          onLongPress: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const TextFormScreen(
                                  text: 'Hello from BLoC',
                                ),
                              ),
                            );
                            if (result != null) {
                              String delayedToast = result[0];
                              Fluttertoast.showToast(msg: delayedToast);
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
              case RegionStatus.initial:
                return const Center(child: CircularProgressIndicator(),);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  CameraOrbit calcOrbit(RegionModel region) {
    var lat = double.parse(region.latitude);
    var long = double.parse(region.longitude);

    var latOrb = 180 - (lat + 90);
    var longOrb = long >= 0 ? long : 360 + long;
    longOrb = (longOrb + 180) % 360;

    return CameraOrbit(longOrb, latOrb, 2000);
  }

  int calcDots() {
    int dots = (MediaQuery.of(context).size.width - 100) ~/ 26;
    if (dots.isEven) dots--;
    return dots;
  }
}