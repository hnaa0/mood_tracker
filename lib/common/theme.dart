import 'package:flutter/material.dart';
import 'package:mood_tracker/constants/colors.dart';

abstract class MoodTrackerTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: "Pretendard",
    scaffoldBackgroundColor: const Color(0xffF7F9F2),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(ThemeColors.uranianBlue),
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(ThemeColors.babypowder),
      foregroundColor: Color(ThemeColors.outerSpace),
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(ThemeColors.babypowder),
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Color(
          ThemeColors.davysGray,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: "Pretendard",
    scaffoldBackgroundColor: const Color(ThemeColors.outerSpace),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(ThemeColors.uranianBlue),
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(ThemeColors.outerSpace),
      foregroundColor: Color(ThemeColors.babypowder),
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(ThemeColors.outerSpace),
      elevation: 0,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: TextStyle(
        color: Color(
          ThemeColors.davysGray,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
  );
}
