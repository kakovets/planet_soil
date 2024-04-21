import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_soil/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/theme/theme.dart';
import 'features/regions/route.dart';
import 'features/settings/route.dart';
import 'features/settings/screens/inner_settings_screen.dart';

// GoRouter tutorial:
// https://github.com/bizz84/nested_navigation_examples/tree/main/examples/gorouter

// BLoC tutorial:
// https://github.com/felangel/bloc/tree/master/examples/flutter_infinite_list

final _rootNavKey = GlobalKey<NavigatorState>();
final _shellNavKeyPlanet = GlobalKey<NavigatorState>();
final _shellNavKeySettings = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider()..getSavedTheme(),
        ),
      ],
      child: Builder(
        builder: (context) => MaterialApp.router(
          theme: Provider.of<ThemeProvider>(context).themeData,
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

final goRouter = GoRouter(
  initialLocation: '/planet',
  navigatorKey: _rootNavKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavKeyPlanet,
          routes: [
            GoRoute(
              path: '/planet',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PlanetRoute(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavKeySettings,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsRoute(),
              ),
              routes: [
                GoRoute(
                  path: 'name',
                  builder: (context, state) =>
                  const InnerSettingsScreen(text: 'name',),
                ),
                GoRoute(
                  path: 'units',
                  builder: (context, state) =>
                  const InnerSettingsScreen(text: 'units',),
                ),
                GoRoute(
                  path: 'wifi',
                  builder: (context, state) =>
                  const InnerSettingsScreen(text: 'wifi',),
                ),
                GoRoute(
                  path: 'time',
                  builder: (context, state) =>
                  const InnerSettingsScreen(text: 'time',),
                ),
                GoRoute(
                  path: 'firmware',
                  builder: (context, state) =>
                  const InnerSettingsScreen(text: 'firmware',),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 70,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: [
          NavigationDestination(
            label: 'Planet',
            icon: SvgPicture.asset(
              'assets/icons/earth.svg',
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                Theme.of(context).extension<MyColors>()!.navBarIconColor,
                BlendMode.srcIn,
              ),
            ),
            selectedIcon:
            SvgPicture.asset(
              'assets/icons/earth.svg',
              width: 26,
              height: 26,
              colorFilter: ColorFilter.mode(
                Theme.of(context).extension<MyColors>()!.navBarActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const NavigationDestination(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}