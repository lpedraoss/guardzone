import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardzone/core/utils/color/global_color.dart';

/// Dark theme data for the GuardZone application.
var themeDark = ThemeData.dark();

/// Get the customized GuardZone theme based on the dark theme.
ThemeData getGuardZoneDarkTheme() {
  return themeDark.copyWith(
    scaffoldBackgroundColor: GlobalColor.green_900,
    appBarTheme: const AppBarTheme(
      color: GlobalColor.green_800,
    ),
    shadowColor: GlobalColor.black_26_percent,
    focusColor: GlobalColor.green_A400,
    buttonTheme: const ButtonThemeData(
      buttonColor: GlobalColor.red_700,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(GlobalColor.red_700),
      ),
    ),
    cardColor: GlobalColor.green_700,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: GlobalColor.green_A100,
        ),
      ),
      labelStyle: const TextStyle(
        color: GlobalColor.green_A100,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: GlobalColor.green_700,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    ),
    cardTheme: CardTheme(
      color: GlobalColor.green_800,
      shadowColor: GlobalColor.black_26_percent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: GlobalColor.green_800,
        ),
        borderRadius: BorderRadius.circular(8), // Radio de borde
      ),
    ),
    textTheme: GoogleFonts.abyssinicaSilTextTheme()
        .apply(bodyColor: GlobalColor.green_A100)
        .copyWith(
          headlineMedium: const TextStyle(
            color: GlobalColor.green_A100,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(color: GlobalColor.green_A100),
          bodySmall: const TextStyle(color: GlobalColor.green_A100),
          bodyLarge: const TextStyle(color: GlobalColor.green_A100),
          bodyMedium: const TextStyle(
            color: GlobalColor.green_A100,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: const TextStyle(color: GlobalColor.green_A100),
          labelMedium: const TextStyle(
            color: GlobalColor.green_A100,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: const TextStyle(
            color: GlobalColor.green_A100,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: GlobalColor.green_A100,
          ),
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: GlobalColor.green_A400,
      unselectedLabelColor: GlobalColor.green_200,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GlobalColor.green_A100,
            width: 2.0,
          ),
        ),
      ),
    ),
    colorScheme: themeDark.colorScheme.copyWith(
      surface: GlobalColor.green_800,
      primary: GlobalColor.green_500,
      secondary: GlobalColor.red_500,
      primaryContainer: GlobalColor.green_700,
    ),
  );
}
