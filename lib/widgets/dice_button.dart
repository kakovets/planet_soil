import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiceIconButton extends StatefulWidget {

  /// Dice IconButton, that with [onPressed] performs one full rotation,
  /// lifts up and land down.
  const DiceIconButton({super.key, required this.onPressed,});

  final Function onPressed;

  @override
  State<DiceIconButton> createState() => _DiceIconButtonState();
}

class _DiceIconButtonState extends State<DiceIconButton>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _liftAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500,),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi,)
        .animate(_controller);

    _liftAnimation = Tween<double>(begin: 0.0, end: 20.0,).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut,),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double lift = 2 * min(_liftAnimation.value, 20 - _liftAnimation.value);
        return Transform.translate(
          offset: Offset(0.0, -lift,),
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/random.svg',
                width: 60,
                height: 60,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {
                _startAnimation();
                widget.onPressed.call();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }
}