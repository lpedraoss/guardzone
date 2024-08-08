// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class GlobalColor {
  /// A class that defines a set of color constants for the application theme
  GlobalColor._();

  ///color rich black
  static const Color richBlack = Color(0xFF0E0E10);

  ///color rich black -80
  static const Color richBlackMinus80 = Color(0xFF010102);

  ///color neutral colors/light/culture 80
  static const Color culture80 = Color(0xFFFEFEFE);

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
