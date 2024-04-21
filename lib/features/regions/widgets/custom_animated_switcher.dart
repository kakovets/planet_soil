import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatelessWidget {

  /// AnimatedSwitcher with Scale and Rotation Transition.
  const CustomAnimatedSwitcher({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (
          Widget child,
          Animation<double> animation,
          ) {
        return ScaleTransition(
          scale: animation,
          child: RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0)
                .animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}