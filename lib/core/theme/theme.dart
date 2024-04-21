import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors extends ThemeExtension<MyColors> {

  const MyColors({
    required this.dotColor,
    required this.activeDotColor,
    required this.navBarIconColor,
    required this.navBarActiveIconColor,
  });

  final Color dotColor;
  final Color activeDotColor;
  final Color navBarIconColor;
  final Color navBarActiveIconColor;


  @override
  ThemeExtension<MyColors> copyWith({
    Color? dotColor,
    Color? activeDotColor,
    Color? navBarIconColor,
    Color? navBarActiveIconColor,
  }) {
    return MyColors(
      dotColor: dotColor ?? this.dotColor,
      activeDotColor: activeDotColor ?? this.activeDotColor,
      navBarIconColor: navBarIconColor ?? this.navBarIconColor,
      navBarActiveIconColor: navBarActiveIconColor ?? this.navBarActiveIconColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
      covariant ThemeExtension<MyColors>? other, double t,) {
    if (other == null) return this;
    if (other is MyColors) {
      return MyColors(
        dotColor: Color.lerp(dotColor, other.dotColor, t)!,
        activeDotColor: Color.lerp(activeDotColor, other.activeDotColor, t)!,
        navBarIconColor: Color.lerp(navBarIconColor, other.navBarIconColor, t)!,
        navBarActiveIconColor: Color.lerp(navBarActiveIconColor, other.navBarActiveIconColor, t)!,
      );
    }
    throw ArgumentError.value(
      other, 'other', 'Cannot interpolate between different types',);
  }
}

ThemeData lightMode = ThemeData(
  extensions: const <ThemeExtension<MyColors>>[
    MyColors(
      dotColor: Colors.black26,
      activeDotColor: Colors.deepOrange,
      navBarIconColor: Colors.black,
      navBarActiveIconColor: Colors.black,
    ),
  ],
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    outline: Colors.black,
    background: Colors.yellow.shade100,
    surfaceTint: Colors.transparent,
  ),

  textTheme: GoogleFonts.comfortaaTextTheme(),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.cyan),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.yellow.shade600,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Colors.transparent,
    // backgroundColor: Colors.transparent,
    backgroundColor: const Color(0xFFDEC0F1),
    indicatorColor: Colors.yellow.shade100.withOpacity(0.8),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Color(0xFFDEC0F1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
  ),

  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Colors.black,
  ),

);

ThemeData darkMode = ThemeData(
  extensions: <ThemeExtension<MyColors>>[
    MyColors(
      dotColor: Colors.grey.withOpacity(.5),
      activeDotColor: Colors.deepOrange.shade300,
      navBarIconColor: Colors.white,
      navBarActiveIconColor: Colors.black,
    ),
  ],
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    outline: Colors.white,
    background: Color(0xFF4D3B4D),
    surfaceTint: Colors.transparent,
  ),

  textTheme: GoogleFonts.comfortaaTextTheme(),

  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.cyan.shade700),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.purple.shade900,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Colors.transparent,
    backgroundColor: const Color(0xFF855C99),
    indicatorColor: Colors.yellow.shade100.withOpacity(0.8),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Color(0xFF855C99),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
  ),

  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Colors.black,
  ),

);