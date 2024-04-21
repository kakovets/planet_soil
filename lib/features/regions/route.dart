import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_soil/features/regions/screens/planet_screen.dart';
import 'bloc/regions_bloc.dart';

class PlanetRoute extends StatelessWidget {
  const PlanetRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegionBloc()..add(RegionFetched()),
      child: const PlanetScreen(),
    );
  }
}