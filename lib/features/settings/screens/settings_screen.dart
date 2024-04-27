import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/ink_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 10,),

                // NAME
                InkTile(
                  title: 'NAME',
                  subTitle: 'Lando Norris',
                  icon: Icons.edit,
                  func: () => context.goNamed('name'),
                ),

                // UNITS
                InkTile(
                  title: 'UNITS',
                  subTitle: 'Celsius',
                  icon: Icons.thermostat,
                  func: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              GestureDetector(
                                child: Container(
                                  color: Colors.grey.shade100,
                                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: const Text(
                                    'Celsius',
                                    style: TextStyle(fontSize:16),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context.goNamed(
                                    'units',
                                    pathParameters: {'unit': 'celsius'},
                                  );
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  color: Colors.grey.shade100,
                                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  child: const Text(
                                    'Fahrenheit',
                                    style: TextStyle(fontSize:16),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context.goNamed(
                                    'units',
                                    pathParameters: {'unit': 'fahrenheit'},
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),

                // WIFI
                InkTile(
                  title: 'WIFI',
                  subTitle: 'qwertynet',
                  icon: Icons.wifi,
                  func: () => context.go('/settings/wifi'),
                ),

                // TIME
                InkTile(
                  title: 'TIME',
                  subTitle: 'Auto',
                  icon: Icons.access_time_outlined,
                  func: () => context.go('/settings/time'),
                ),

                // FIRMWARE
                InkTile(
                  title: 'FIRMWARE',
                  subTitle: 'Tap to check',
                  icon: Icons.code,
                  func: () => context.go('/settings/firmware'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}