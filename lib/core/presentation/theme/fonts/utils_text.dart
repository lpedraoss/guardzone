import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final baseTextTheme = GoogleFonts.montserratTextTheme();
final baseTextStyle = GoogleFonts.montserrat();

extension TextStyles on BuildContext {
  TextStyle get headlineLarge =>
      Theme.of(this).textTheme.headlineLarge ??
      baseTextTheme.headlineLarge ??
      baseTextStyle;

  TextStyle get headlineMedium =>
      Theme.of(this).textTheme.headlineMedium ??
      baseTextTheme.headlineMedium ??
      baseTextStyle;

  TextStyle get bodySmall =>
      Theme.of(this).textTheme.bodySmall ??
      baseTextTheme.bodySmall ??
      baseTextStyle;

  TextStyle get bodyMedium =>
      Theme.of(this).textTheme.bodyMedium ??
      baseTextTheme.bodyMedium ??
      baseTextStyle;
  TextStyle get bodyLarge =>
      Theme.of(this).textTheme.bodyLarge ??
      baseTextTheme.bodyLarge ??
      baseTextStyle;

  TextStyle get displaySmall =>
      Theme.of(this).textTheme.displaySmall ??
      baseTextTheme.displaySmall ??
      baseTextStyle;

  TextStyle get titleMedium =>
      Theme.of(this).textTheme.titleMedium ??
      baseTextTheme.titleMedium ??
      baseTextStyle;

  TextStyle get titleSmall =>
      Theme.of(this).textTheme.titleSmall ??
      baseTextTheme.titleSmall ??
      baseTextStyle;

  TextStyle get labelMedium =>
      Theme.of(this).textTheme.labelMedium ??
      baseTextTheme.labelMedium ??
      baseTextStyle;
}
