// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:guardzone/core/utils/color/global_color.dart';

/// A class that defines a set of color constants for the application theme
///
/// The colors are defined in the GlobalColor class
///
/// and are accessed using the context extension
extension ColorsTheme on BuildContext {
  /// A map that defines a set of color constants for the application theme
  ///
  /// The colors are defined in the GlobalColor class
  ///
  /// and are accessed using the context extension
  Map<String, Color> get greenColors => {
        '500': GlobalColor.green_500,
        '50': GlobalColor.green_50,
        '100': GlobalColor.green_100,
        '200': GlobalColor.green_200,
        '300': GlobalColor.green_300,
        '400': GlobalColor.green_400,
        '600': GlobalColor.green_600,
        '700': GlobalColor.green_700,
        '800': GlobalColor.green_800,
        '900': GlobalColor.green_900,
        'A100': GlobalColor.green_A100,
        'A200': GlobalColor.green_A200,
        'A400': GlobalColor.green_A400,
        'A700': GlobalColor.green_A700,
      };

  ///intensity of the red color
  Map<String, Color> get redColors => {
        '500': GlobalColor.red_500,
        '50': GlobalColor.red_50,
        '100': GlobalColor.red_100,
        '200': GlobalColor.red_200,
        '300': GlobalColor.red_300,
        '400': GlobalColor.red_400,
        '600': GlobalColor.red_600,
        '700': GlobalColor.red_700,
        '800': GlobalColor.red_800,
        '900': GlobalColor.red_900,
        'A100': GlobalColor.red_A100,
        'A200': GlobalColor.red_A200,
      };

  ///color rich black
  Color get richBlack => GlobalColor.richBlack;

  ///color rich black -80
  Color get richBlackMinus80 => GlobalColor.richBlackMinus80;

  ///color neutral colors/light/culture 80
  Color get culture80 => GlobalColor.culture80;

  /// Cultured  Op 10%
  Color get culturedOP10 => GlobalColor.culturedOP10;

  /// Banco translucido
  Color get whiteTranslucent => GlobalColor.whiteTranslucent;

  /// red with Opacity
  Color get redWithOpacity => GlobalColor.redWithOpacity;

  ///red intense
  Color get redIntense => GlobalColor.redIntense;

  /// deep red. rojo vinoso
  Color get burgundy => GlobalColor.burgundy;

  /// blackShadow
  Color get blackShadow => GlobalColor.blackShadow;

  ///vibrant purple
  Color get purpleVibrant => GlobalColor.purpleVibrant;
  // Light Dark Gray
  Color get lightDarkGray => GlobalColor.lightDarkGray;

  /// bluish-gray tone. Secundary Text
  Color get grayBuish => GlobalColor.grayBuish;
  Color get darkGray => GlobalColor.darkGray;
  Color get darkBlue => GlobalColor.darkBlue;
  Color get darkGreen => GlobalColor.darkGreen;
  Color get darkRed => GlobalColor.darkRed;
  Color get primary_background => GlobalColor.dark_slate_gray;
  Color get secondary_background => GlobalColor.dark_midnight_blue;

  static gradient1() {
    return const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]);
  }

  gradient2() {
    return const LinearGradient(colors: [Colors.purple, Colors.red]);
  }

  gradient3() {
    return LinearGradient(
      colors: [
        blackShadow,
        redIntense,
        redWithOpacity,
        richBlack,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static gradient5() {
    return const LinearGradient(colors: [Colors.orange, Colors.yellow]);
  }

  LinearGradient get primary_gradient => GlobalColor.darkSlateGrayGradient;
  LinearGradient get secondary_gradient => GlobalColor.darkMidnightBlueGradient;
  LinearGradient get backgroundGradient => GlobalColor.backgroundGradient;
  LinearGradient get backgroundGradient_1 => GlobalColor.backgroundGradient_1;
  LinearGradient get backgroundGradient_2 => GlobalColor.backgroundGradient_2;
  LinearGradient get backgroundGradient_3 => GlobalColor.backgroundGradient_3;
  LinearGradient get backgroundGradient_4 => GlobalColor.backgroundGradient_4;
}
