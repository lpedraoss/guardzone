import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guardzone/core/utils/color/global_color.dart';


/// Light theme data for the GuardZone application.
var themeLight = ThemeData.light();

/// Get the customized GuardZone light theme.
ThemeData getGuardZoneLightTheme() {
  return themeLight.copyWith(
    scaffoldBackgroundColor: GlobalColor.culture80,

    appBarTheme: const AppBarTheme(
      color: GlobalColor.green_500,
    ),

    shadowColor: GlobalColor.blackShadow,
    focusColor: GlobalColor.green_500,
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
          color: GlobalColor.richBlack,
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
        .apply(bodyColor: GlobalColor.richBlack)
        .copyWith(
          headlineMedium: const TextStyle(
            color: GlobalColor.richBlack,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: const TextStyle(color: GlobalColor.richBlack),
          bodySmall: const TextStyle(color: GlobalColor.richBlack),
          bodyMedium: const TextStyle(
            color: GlobalColor.richBlack,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: const TextStyle(color: GlobalColor.richBlack),
          labelMedium: const TextStyle(
            color: GlobalColor.grayBuish,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: const TextStyle(
            color: GlobalColor.richBlack,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            color: GlobalColor.richBlack,
          ),
        ),
    tabBarTheme: const TabBarTheme(
      labelColor: GlobalColor.purpleVibrant,
      unselectedLabelColor: GlobalColor.grayBuish,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: GlobalColor.richBlack,
            width: 2.0,
          ),
        ),
      ),
    ),

    colorScheme: themeLight.colorScheme.copyWith(
      surface: GlobalColor.richBlack,
      primary: GlobalColor.richBlack,
      secondary: GlobalColor.redIntense,
      primaryContainer: GlobalColor.purpleVibrant,

      //secondary: GlobalColor.richBlack,
    ),
    //textTheme: themeLight.textTheme.copyWith(c)
  );
}
