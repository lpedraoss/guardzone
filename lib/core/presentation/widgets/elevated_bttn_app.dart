import 'package:flutter/material.dart';

import 'package:guardzone/core/utils/color/global_color.dart';

class ElevatedBttnApp extends StatelessWidget {
  const ElevatedBttnApp({
    super.key,
    required this.onPressed,
    this.width,
    this.title,
    this.borderRadius,
    this.color,
    this.elevation,
  });

  final Function() onPressed;
  final double? width;
  final String? title;
  final Color? color;
  final double? borderRadius, elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      elevation: elevation ?? 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          boxShadow: [
            BoxShadow(
              color: GlobalColor.black_26_percent,
              spreadRadius: elevation ?? 8,
              blurRadius: elevation ?? 8,
              offset: Offset(0, elevation ?? 8),
            ),
          ],
          color: color ?? GlobalColor.redIntense,
        ),
        width: width ?? 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(
                  0), // Desactiva el sombreado predeterminado del ElevatedButton
              backgroundColor: WidgetStateProperty.all(
                color ?? GlobalColor.redWithOpacity,
              ),
            ),
            onPressed: onPressed,
            child: Center(
              child: Text(
                title ?? 'elevated button app',
                style: const TextStyle(color: GlobalColor.green_A100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}