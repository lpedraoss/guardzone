// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class GlobalColor {
  /// A class that defines a set of color constants for the application theme
  GlobalColor._();

  ///color green 500
  static const Color green_500 = Color(0xff4caf50);
  ///color green 50
  static const Color green_50 = Color(0xffe8f5e9);
  ///color green 100
  static const Color green_100 = Color(0xffc8e6c9);
  ///color green 200
  static const Color green_200 = Color(0xffa5d6a7);
  ///color green 300
  static const Color green_300 = Color(0xff81c784);
  ///color green 400
  static const Color green_400 = Color(0xff66bb6a);
  ///color green 600
  static const Color green_600 = Color(0xff43a047);
  ///color green 700
  static const Color green_700 = Color(0xff388e3c);
  ///color green 800
  static const Color green_800 = Color(0xff2e7d32);
  ///color green 900
  static const Color green_900 = Color(0xff1b5e20);
  ///color green A100
  static const Color green_A100 = Color(0xffb9f6ca);
  ///color green A200
  static const Color green_A200 = Color(0xff69f0ae);
  ///color green A400
  static const Color green_A400 = Color(0xff00e676);
  ///color green A700
  static const Color green_A700 = Color(0xff00c853);
  ///color red 500
  static const Color red_500 = Color(0xfff44336);
  ///color red 50
  static const Color red_50 = Color(0xffffebee);
  ///color red 100
  static const Color red_100 = Color(0xffffcdd2);
  ///color red 200
  static const Color red_200 = Color(0xffef9a9a);
  ///color red 300
  static const Color red_300 = Color(0xffe57373);
  ///color red 400
  static const Color red_400 = Color(0xffef5350);
  ///color red 600
  static const Color red_600 = Color(0xffe53935);
  ///color red 700
  static const Color red_700 = Color(0xffd32f2f);
  ///color red 800
  static const Color red_800 = Color(0xffc62828);
  ///color red 900
  static const Color red_900 = Color(0xffb71c1c);
  ///color red A100
  static const Color red_A100 = Color(0xffff8a80);
  ///color red A200
  static const Color red_A200 = Color(0xffff5252);
  ///color red A400
  static const Color red_A400 = Color(0xffff1744);
  ///color red A700
  static const Color red_A700 = Color(0xffd50000);
  
  /// intensity black color
  /// 
  /// 100% black
  static const Color black_100_percent = Color(0xFF000000);
  /// 87% black
  /// 
  /// for Text
  static const Color black_87_percent = Color(0xDD000000);
  /// 54% black
  /// 
  /// for Icon and secondary text
  static const Color black_54_percent = Color(0x8A000000);
  /// 26% black
  /// 
  /// for disabled button and hint text
  static const Color black_26_percent = Color(0x42000000);
  /// 12% black
  /// 
  /// for dividers
  static const Color black_12_percent = Color(0x1F000000);
  ///color rich black
  static const Color richBlack = Color(0xFF0E0E10);
  ///color rich black -80
  static const Color richBlackMinus80 = Color(0xFF010102);

  ///intensity white color
  /// 100% white
  /// 
  /// for Text and icons
  static const Color white_100_percent = Color(0xFFFFFFFF);
  /// 70% white
  /// 
  ///for Secondary Text
  static const Color white_70_percent = Color(0xB3FFFFFF);
  /// 30% white
  /// 
  /// for disabled button and hint text
  static const Color white_30_percent = Color(0x4DFFFFFF);
  /// 12% white
  /// 
  /// for dividers
  static const Color white_12_percent = Color(0x1F000000);
  ///color neutral colors/light/culture 80
  static const Color culture80 = Color(0xFFFEFEFE);
  ///intentisty grey color
  ///color grey 600
  static const Color grey_600 = Color(0xFF757575);
  ///color grey 300
  static const Color grey_300 = Color(0xFFE0E0E0);
  ///color grey 200
  static const Color grey_200 = Color(0xFFEEEEEE);
  ///color grey 50
  static const Color grey_50 = Color(0xFFFAFAFA);
  /// Cultured  Op 10%
  static const Color culturedOP10 = Color(0x1affffff);

  /// Banco translucido
  static const Color whiteTranslucent = Color(0xD3FFFFFF);

  /// red with Opacity
  static const Color redWithOpacity = Color.fromARGB(210, 255, 0, 0);

  ///red intense
  static const Color redIntense = Color.fromRGBO(255, 0, 5, 1);

  /// deep red. rojo vinoso
  static const Color burgundy = Color.fromRGBO(133, 10, 10, 1);

  /// blackShadow
  static const Color blackShadow = Color(0x33000000);

  ///vibrant purple
  static const Color purpleVibrant = Color.fromRGBO(75, 57, 239, 1);
  // Light Dark Gray
  static const Color lightDarkGray = Color(0xFF1C1C1E);

  /// bluish-gray tone. Secundary Text
  static const Color grayBuish = Color.fromRGBO(149, 161, 172, 1);
  static const Color darkGray = Color(0xFF333333);
  static const Color darkBlue = Color(0xFF001F3F);
  static const Color darkGreen = Color(0xFF004080);
  static const Color darkRed = Color(0xFF800000);

  static const Color dark_slate_gray = Color.fromRGBO(29, 36, 40, 1);

  static const Color dark_midnight_blue = Color.fromRGBO(20, 24, 27, 1);

  static const LinearGradient darkSlateGrayGradient = LinearGradient(
    colors: [
      Color.fromRGBO(29, 36, 40, 1), // dark_slate_gray
      Color.fromRGBO(50, 60, 70, 1), // un tono más claro
      Color.fromRGBO(70, 84, 96, 1), // un tono aún más claro
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient darkMidnightBlueGradient = LinearGradient(
    colors: [
      Color.fromRGBO(20, 24, 27, 1), // dark_midnight_blue
      Color.fromRGBO(30, 36, 40, 1), // un tono más claro
      Color.fromRGBO(40, 48, 54, 1), // un tono aún más claro
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static gradient1() {
    return const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]);
  }

  static gradient2() {
    return const LinearGradient(colors: [Colors.purple, Colors.red]);
  }

  static gradient3() {
    return const LinearGradient(
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

  static const LinearGradient backgroundGradient_4 = LinearGradient(
    colors: [
      Color(0xFF000020), // Negro azulado oscuro
      Color(0xFF171a4a), // Azul oscuro
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.8], // Ajusta estos valores según tus preferencias
    tileMode: TileMode.clamp,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF141416), // Darker shade
      Color(0xFF1C1C1E), // Original cardColor
      Color(0xFF242426),
// Lighter shade
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient backgroundGradient_1 = LinearGradient(
    colors: [Colors.black, Color(0xC6000420), Color(0x97000931)],
    stops: [0, 0.5, 1],
    begin: AlignmentDirectional(-1, -1),
    end: AlignmentDirectional(1, 1),
  );
  static const LinearGradient backgroundGradient_2 = LinearGradient(
    colors: [Colors.black, Color(0xC6000420), Color(0x97000931)],
    stops: [0, 0.5, 1],
    begin: AlignmentDirectional(-1, -1),
    end: AlignmentDirectional(1, 1),
  );
  static const LinearGradient backgroundGradient_3 = LinearGradient(
    colors: [
      Color.fromARGB(255, 11, 4, 36),

      Color.fromARGB(255, 65, 58, 90),

// Lighter shade
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
