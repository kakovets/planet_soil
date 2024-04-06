import 'package:flutter/material.dart';

mixin ScrollMixin {
  Widget buildScrollableWithBouncingPhysicsAndNoOverscroll({
    required Widget child,
  }) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: child,
      ),
    );
  }
}