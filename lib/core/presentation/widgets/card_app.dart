import 'package:flutter/material.dart';
import 'package:guardzone/core/utils/color/global_color.dart';

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
  });

  final Color? color;
  final Widget? child;
  final double? width, height, size;
  final EdgeInsets? padding, paddingCard;
  final BorderRadiusGeometry? borderRadius;
  final Decoration? decoration;
  final Gradient? gradient;
  final bool? withGradient, withBoxShadow;

  @override
  Widget build(BuildContext context) {
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
                          color ?? GlobalColor.green_700,
                          color?.withOpacity(0.9) ?? GlobalColor.green_700,
                        ],
                      )
                  : null,
              boxShadow: withBoxShadow ?? true == true
                  ? [
                      const BoxShadow(
                        color: GlobalColor.black_26_percent,
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                      const BoxShadow(
                        color:
                      GlobalColor.white_30_percent,
                        offset: Offset(0, -2),
                        blurRadius: 4,
                      ),
                    ]
                  : null,
            ),
        child: child ??
            const Center(
              child: Text(
                'Card App',
                style: TextStyle(color: GlobalColor.green_A100),
              ),
            ),
      ),
    );
  }
}