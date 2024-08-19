import 'package:flutter/material.dart';

class CardApp extends StatelessWidget {
  const CardApp({
    super.key,
    this.color,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.size,
    this.padding,
    this.decoration,
    this.paddingCard,
    this.withGradient,
    this.withBoxShadow,
    this.gradient,
    this.boxShadow,
    this.withBorder,
    this.borderColor,
    this.borderWidth,
  });

  final Color? color;
  final Widget? child;
  final double? width, height, size;
  final EdgeInsets? padding, paddingCard;
  final BorderRadiusGeometry? borderRadius;
  final Decoration? decoration;
  final Gradient? gradient;
  final bool? withGradient, withBoxShadow, withBorder;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: paddingCard ?? EdgeInsets.zero,
      child: Container(
        padding: padding ?? EdgeInsets.zero,
        width: size ?? width,
        height: size ?? height,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              gradient: withGradient ?? true == true
                  ? gradient ??
                      LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color ?? theme.colorScheme.primary,
                          color?.withOpacity(0.9) ??
                              theme.colorScheme.primary.withOpacity(0.9),
                        ],
                      )
                  : null,
              boxShadow: withBoxShadow ?? true == true
                  ? boxShadow ??
                      [
                        BoxShadow(
                          color: theme.shadowColor,
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        ),
                        BoxShadow(
                          color: theme.colorScheme.onSurface.withOpacity(0.3),
                          offset: const Offset(0, -2),
                          blurRadius: 4,
                        ),
                      ]
                  : null,
              border: withBorder ?? false
                  ? Border.all(
                      color: borderColor ?? theme.colorScheme.onPrimary,
                      width: borderWidth ?? 4.0,
                    )
                  : null,
            ),
        child: child ?? 
            Center(
              child: Text(
                'Card App',
                style: TextStyle(color: theme.colorScheme.onPrimary),
              ),
            ),
      ),
    );
  }
}