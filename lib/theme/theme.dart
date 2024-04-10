import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors extends ThemeExtension<MyColors> {

  const MyColors({
    required this.dotColor,
    required this.activeDotColor,
  });

  final Color dotColor;
  final Color activeDotColor;

  @override
  ThemeExtension<MyColors> copyWith({Color? dotColor, Color? activeDotColor,}) {
    return MyColors(
      dotColor: dotColor ?? this.dotColor,
      activeDotColor: activeDotColor ?? this.activeDotColor,
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