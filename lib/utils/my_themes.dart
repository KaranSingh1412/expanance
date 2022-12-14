import 'package:flutter/material.dart';

class MyThemes {
  static const Color _primaryColor = Color(0xffbad7f2);
  // the nice dark-light blue color
  static const Color _secondaryColor = Color(0xffbaf2d8);
  // the nice light blue color
  static const Color _backgroundColor =
      Color(0xffbaf2bb); // actual background color of the app
  static const Color _surfaceColor =
      Color(0xff95EE9D); // color which is used for dialogues

  static ThemeData mainTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      onPrimary: Colors.black,
      secondary: _secondaryColor,
      background: _backgroundColor,
      shadow: Colors.transparent,
      surface: _surfaceColor,
    ),
    dialogTheme: const DialogTheme(backgroundColor: _surfaceColor),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _secondaryColor,
      contentTextStyle: TextStyle(
        fontFamily: "Poppins",
        color: Colors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryColor,
      //shadowColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: _backgroundColor,
    listTileTheme: const ListTileThemeData(
      iconColor: _primaryColor,
    ),
    iconTheme: const IconThemeData(color: Colors.black, size: 30),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _surfaceColor),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            foreground: Paint()..color = Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
    fontFamily: "Poppins",
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(fontWeight: FontWeight.w500),
      headlineMedium: const TextStyle(fontWeight: FontWeight.w500),
      headlineSmall: const TextStyle(fontWeight: FontWeight.w500),
      bodyLarge: const TextStyle(fontWeight: FontWeight.w500),
      bodyMedium: const TextStyle(fontWeight: FontWeight.w500),
      bodySmall: const TextStyle(fontWeight: FontWeight.w500),
      titleLarge: const TextStyle(fontWeight: FontWeight.w500),
      titleMedium: const TextStyle(fontWeight: FontWeight.w500),
      titleSmall: const TextStyle(fontWeight: FontWeight.w500),
      labelLarge: TextStyle(foreground: Paint()..color = _secondaryColor),
      labelMedium: TextStyle(foreground: Paint()..color = _secondaryColor),
      labelSmall: TextStyle(foreground: Paint()..color = _secondaryColor),
    ).apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
    ),
  );
}
