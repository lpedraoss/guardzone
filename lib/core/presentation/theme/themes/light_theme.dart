import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardzone/core/utils/color/global_color.dart';
// Importar el archivo de colores

/// Light theme data for the GuardZone application.
var themeLight = ThemeData.light();

/// Get the customized GuardZone light theme.
ThemeData getGuardZoneLightTheme() {
  return themeLight.copyWith(
    scaffoldBackgroundColor: GlobalColor.green_50,

    appBarTheme: const AppBarTheme(
      color: GlobalColor.green_500,
    ),

    shadowColor: GlobalColor.black_26_percent,
    focusColor: GlobalColor.green_500,
    buttonTheme: const ButtonThemeData(
      buttonColor: GlobalColor.red_500,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(GlobalColor.red_500),
      ),
    ),
    cardColor: GlobalColor.green_100,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: GlobalColor.green_700,
        ),
      ),
      labelStyle: const TextStyle(
        color: GlobalColor.green_700,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: GlobalColor.green_100,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    ),

    cardTheme: CardTheme(
      color: GlobalColor.green_50,
      shadowColor: GlobalColor.black_26_percent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: GlobalColor.green_200,
        ),
        borderRadius: BorderRadius.circular(8), // Radio de borde
      ),
    ),

    textTheme: GoogleFonts.abyssinicaSilTextTheme()
        .apply(bodyColor: GlobalColor.black_87_percent)
        .copyWith(
          headlineMedium: const TextStyle(
            color: GlobalColor.black_87_percent,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(color: GlobalColor.black_87_percent),
          bodySmall: const TextStyle(color: GlobalColor.black_87_percent),
          bodyMedium: const TextStyle(
            color: GlobalColor.black_87_percent,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: const TextStyle(color: GlobalColor.black_87_percent),
          labelMedium: const TextStyle(
            color: GlobalColor.green_700,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: const TextStyle(
            color: GlobalColor.black_87_percent,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: GlobalColor.black_87_percent,
          ),
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: GlobalColor.green_500,
      unselectedLabelColor: GlobalColor.green_200,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GlobalColor.green_700,
            width: 2.0,
          ),
        ),
      ),
    ),

    colorScheme: themeLight.colorScheme.copyWith(
      surface: GlobalColor.green_300,
      primary: GlobalColor.green_500,
      secondary: GlobalColor.red_500,
      primaryContainer: GlobalColor.green_100,
    ),
  );
}