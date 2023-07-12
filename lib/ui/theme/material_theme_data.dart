import 'package:flutter/material.dart';

class ThemeConfig {
  static const Color experimentalPrimaryColor = Color(0xffdc2430);
  static const Color experimentalSecondaryColor = Color(0xffffd89b);
  static const Color experimentalAccentColor = Color(0xFF326BD6);

  static const Color experimentalBackgroundColor = Color(0xf9FFF6F6);

  static const Color experimentalTertiary = Color(0xFFFFF6F6);
  static const Color experimentalTextColor = Color(0xff444444);

  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightBG = Colors.green;
  static Color darkBG = Colors.green;

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightBG,
      brightness: Brightness.light,
    ),
    focusColor: Colors.black,
    colorSchemeSeed: Colors.black,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
      ),
    ),
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      color: darkPrimary,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
