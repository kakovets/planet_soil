import 'package:flutter/material.dart';

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
            tap: () => callback.call(),
            longPress: () {},
            pathToIcon: 'assets/icons/refresh.svg',
            splashColor: Colors.blue,
          ),
        ],
      ),
      body: const Center(
        child: Text('Misha, vsyo hernya, davai po novoi'),
      ),
    );
  }
}
