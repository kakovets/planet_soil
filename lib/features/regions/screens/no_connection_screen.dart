import 'package:flutter/material.dart';
import '../bloc/regions_bloc.dart';
import '../widgets/custom_ink_well.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key, required this.callback});

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomInkWell(
            tap: () => callback.call((RegionFetched())),
            longPress: () {},
            pathToIcon: 'assets/icons/refresh.svg',
            splashColor: Colors.blue,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/misha.jpeg'),
          ),
          const SizedBox(height: 20,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Misha, vsyo hernya, davai po novoi'),
            ],
          ),
        ],
      ),
    );
  }
}