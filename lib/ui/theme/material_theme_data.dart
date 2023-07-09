import 'package:flutter/material.dart';

class ThemeConfig {
  static const Color experimentalPrimaryColor = Color(0xffdc2430);
  static const Color experimentalAccentColor = Color(0xffffd89b);

  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color darkAccent = const Color(0xff2ca8e2);
  static Color lightBG = Colors.green;
  static Color darkBG = Colors.green;

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightBG,
      brightness: Brightness.light,
    ),
    primaryColor: experimentalPrimaryColor,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: const AppBarTheme(
      color: experimentalPrimaryColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: darkBG,
      brightness: Brightness.dark,
    ),
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      color: darkPrimary,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
