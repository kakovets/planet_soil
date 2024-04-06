import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInkWell extends StatelessWidget {

  const CustomInkWell({
    super.key,
    required this.tap,
    required this.longPress,
    required this.pathToIcon,
    required this.splashColor,
  });

  final Function tap;
  final Function longPress;
  final String pathToIcon;
  final Color splashColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        tap.call();
      },
      onLongPress: () {
        longPress.call();
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          pathToIcon,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!,  // Theme.of(context)
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}