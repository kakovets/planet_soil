import 'package:flutter/material.dart';
import 'dice_button.dart';

class O3dCard extends StatelessWidget {
  final Widget o3d;
  final Function func;

  const O3dCard({
    super.key,
    required this.o3d,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.blue.withOpacity(.4),
      elevation: 0,
      child: Stack(
        children: [
          o3d,
          Positioned(
            top: 2.0,
            right: 2.0,
            child: DiceIconButton(
              onPressed: () {
                func.call();
              },
            ),
          ),
        ],
      ),
    );
  }
}