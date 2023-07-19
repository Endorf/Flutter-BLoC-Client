import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeConfig {
  static const Color experimentalPrimaryColorLight = Color(0xffdc2430);
  static const Color experimentalAccentColorLight = Color(0xFF326BD6);
  static const Color experimentalBackgroundColorLight = Color(0xe0FFF6F6);
  static const Color experimentalTextColorLight = Color(0xff444444);
  static const Color experimentalTertiaryLight = Color(0xFFFFF6F6);
  static const Color experimentalOnTertiaryLight = Color(0xffdc2430);

  static const Color experimentalPrimaryColorDark = Color(0xffdc2430);
  static const Color experimentalAccentColorDark = Color(0xff6c9696);
  static const Color experimentalBackgroundColorDark = Color(0xe0333333);
  static const Color experimentalTextColorDark = Color(0x9BD8FFFF);
  static const Color experimentalTertiaryDark = Color(0xFF5F0404);
  static const Color experimentalOnTertiaryDark = Color(0xBCFFFFFF);

  static const Color experimentalTertiary = Color(0xFFFFF6F6);

  static bool get _isDarkMode =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
      Brightness.dark;

  static TextStyle get textStyle => TextStyle(
      color: _isDarkMode
          ? ThemeConfig.experimentalTextColorDark
          : ThemeConfig.experimentalTextColorLight);

  static TextStyle get textSmallStyle => TextStyle(
        fontStyle: FontStyle.italic,
        color: _isDarkMode
            ? ThemeConfig.experimentalTextColorDark
            : ThemeConfig.experimentalTextColorLight,
      );

  static TextStyle get labelStyle => TextStyle(
      color: _isDarkMode
          ? ThemeConfig.experimentalAccentColorDark
          : ThemeConfig.experimentalAccentColorLight);

  static themeData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: _isDarkMode
            ? ThemeConfig.experimentalAccentColorDark
            : ThemeConfig.experimentalAccentColorLight,
        onPrimaryContainer: _isDarkMode
            ? ThemeConfig.experimentalAccentColorDark
            : ThemeConfig.experimentalPrimaryColorLight,
        onPrimary: Colors.white,
        background: _isDarkMode
            ? ThemeConfig.experimentalBackgroundColorDark
            : ThemeConfig.experimentalBackgroundColorLight,
        onSurfaceVariant: _isDarkMode
            ? ThemeConfig.experimentalTextColorDark
            : ThemeConfig.experimentalTextColorLight,
        onTertiary: _isDarkMode
            ? ThemeConfig.experimentalOnTertiaryDark
            : ThemeConfig.experimentalOnTertiaryLight,
        tertiaryContainer: _isDarkMode
            ? ThemeConfig.experimentalTertiaryDark
            : ThemeConfig.experimentalTertiaryLight,
        error: ThemeConfig.experimentalPrimaryColorDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: _isDarkMode
                ? ThemeConfig.experimentalAccentColorDark
                : ThemeConfig.experimentalAccentColorLight,
            foregroundColor: ThemeConfig.experimentalTertiary,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
      textTheme: TextTheme(
        displayMedium: textStyle,
        displaySmall: textStyle,
        headlineMedium: textStyle,
        headlineSmall: textStyle,
        titleLarge: textStyle,
        titleMedium: textStyle,
        titleSmall: textStyle,
        bodyLarge: textStyle.copyWith(fontSize: 18),
        bodyMedium: textStyle,
        bodySmall: textSmallStyle,
        labelLarge: textStyle,
        labelMedium: labelStyle,
        labelSmall: labelStyle,
      ),
      useMaterial3: true,
    );
  }

// TODO: test themes onward. remove all
  static const Color experimentalPrimaryColor = Color(0xffdc2430);
  static const Color experimentalSecondaryColor = Color(0xffffd89b);
  static const Color experimentalAccentColor = Color(0xFF326BD6);

  static const Color experimentalBackgroundColor = Color(0xf9FFF6F6);

  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightBG = Colors.green;
  static Color darkBG = Colors.green;

  static final ThemeData _lightTheme = ThemeData(
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

  static final ThemeData _darkTheme = ThemeData(
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

  ThemeData _themeLightData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: ThemeConfig.experimentalAccentColor,
        // secondary: ThemeConfig.experimentalAccentColor,
        // onPrimary: ThemeConfig.experimentalAccentColor,
        // primaryContainer: ThemeConfig.experimentalAccentColor,
        // onPrimaryContainer: ThemeConfig.experimentalAccentColor,
        // onSecondary: ThemeConfig.experimentalAccentColor,
        // secondaryContainer: ThemeConfig.experimentalAccentColor,
        // onSecondaryContainer: ThemeConfig.experimentalAccentColor,
        // tertiary: ThemeConfig.experimentalAccentColor,
        // onTertiary: ThemeConfig.experimentalAccentColor,
        // tertiaryContainer: ThemeConfig.experimentalAccentColor,
        // onTertiaryContainer: ThemeConfig.experimentalAccentColor,
        // required this.error,
        // required this.onError,
        // Color? errorContainer,
        // Color? onErrorContainer,
        background: ThemeConfig.experimentalBackgroundColor,
        // onBackground: ThemeConfig.experimentalAccentColor,
        // surface: ThemeConfig.experimentalAccentColor,
        // onSurface: ThemeConfig.experimentalAccentColor,
        // surfaceVariant: ThemeConfig.experimentalAccentColor,
        onSurfaceVariant: ThemeConfig.experimentalPrimaryColor,
        // outline: ThemeConfig.experimentalAccentColor,
        // outlineVariant: ThemeConfig.experimentalAccentColor,
        // shadow: ThemeConfig.experimentalAccentColor,
        // scrim: ThemeConfig.experimentalAccentColor,
        // inverseSurface: ThemeConfig.experimentalAccentColor,
        // onInverseSurface: ThemeConfig.experimentalAccentColor,
        // inversePrimary: ThemeConfig.experimentalAccentColor,
        // surfaceTint: ThemeConfig.experimentalAccentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ThemeConfig.experimentalAccentColor,
            foregroundColor: ThemeConfig.experimentalTertiary,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        displaySmall: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        headlineMedium: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        headlineSmall: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        titleLarge: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        titleMedium: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        titleSmall: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        bodyLarge: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        bodyMedium: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        bodySmall: TextStyle(color: ThemeConfig.experimentalPrimaryColor),
        labelLarge: TextStyle(color: ThemeConfig.experimentalAccentColor),
        labelMedium: TextStyle(color: ThemeConfig.experimentalAccentColor),
        labelSmall: TextStyle(color: ThemeConfig.experimentalAccentColor),
      ),
      useMaterial3: true,
    );
  }
}
