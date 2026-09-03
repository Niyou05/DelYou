import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF7F8FA),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 11, 24, 122),
      brightness: Brightness.light,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    ),

    fontFamilyFallback: List.empty()
  );
}