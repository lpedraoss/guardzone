import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardzone/core/utils/color/global_color.dart';


/// Dark theme data for the MiProj application.
var themeDark = ThemeData.dark();

/// Get the customized MiProj theme based on the dark theme.
ThemeData getMiProjDarkTheme() {
  return themeDark.copyWith(
    scaffoldBackgroundColor: GlobalColor.dark_slate_gray,

    appBarTheme: const AppBarTheme(
      color: GlobalColor.dark_midnight_blue,
    ),

    shadowColor: GlobalColor.blackShadow,
    focusColor: GlobalColor.purpleVibrant,
    buttonTheme: const ButtonThemeData(
      buttonColor: GlobalColor.burgundy,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(GlobalColor.burgundy),
      ),
    ),
    cardColor: GlobalColor.culturedOP10,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: GlobalColor.culture80,
        ),
      ),
      labelStyle: const TextStyle(
        color: GlobalColor.grayBuish,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: GlobalColor.culturedOP10,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
    ),

    cardTheme: CardTheme(
      color: GlobalColor.whiteTranslucent,
      shadowColor: GlobalColor.richBlackMinus80,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: GlobalColor.richBlackMinus80,
        ),
        borderRadius: BorderRadius.circular(8), // Radio de borde
      ),
    ),

    textTheme: GoogleFonts.abyssinicaSilTextTheme()
        .apply(bodyColor: GlobalColor.culture80)
        .copyWith(
          headlineMedium: const TextStyle(
            color: GlobalColor.culture80,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(color: GlobalColor.culture80),
          bodySmall: const TextStyle(color: GlobalColor.culture80),
          bodyLarge: const TextStyle(color: GlobalColor.culture80),
          bodyMedium: const TextStyle(
            color: GlobalColor.culture80,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: const TextStyle(color: GlobalColor.culture80),
          labelMedium: const TextStyle(
            color: GlobalColor.grayBuish,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: const TextStyle(
            color: GlobalColor.culture80,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: GlobalColor.culture80,
          ),
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: GlobalColor.purpleVibrant,
      unselectedLabelColor: GlobalColor.grayBuish,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GlobalColor.culture80,
            width: 2.0,
          ),
        ),
      ),
    ),

    colorScheme: themeDark.colorScheme.copyWith(
      surface: GlobalColor.culture80,
      primary: GlobalColor.culture80,
      secondary: GlobalColor.redIntense,
      primaryContainer: GlobalColor.purpleVibrant,

      //secondary: GlobalColor.culture80,
    ),
    //textTheme: themeDark.textTheme.copyWith(c)
  );
}
