import 'package:flutter/material.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';


class BttnApp extends StatelessWidget {
  const BttnApp({
    super.key,
    this.width,
    this.height,
    this.alignment,
    this.decoration,
    this.title,
    this.textStyle,
    this.onTap,
    this.color,
    this.child,
  });
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;
  final String? title;
  final TextStyle? textStyle;
  final Function()? onTap;
  final Color? color;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius:  BorderRadius.circular(50),
        splashColor: Theme.of(context).primaryColor, // Color del efecto de onda
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: width ?? 100,
          height: height ?? 30,
          alignment: alignment ?? Alignment.center,
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color ?? context.redIntense,
              ),
          child: child ??
              Text(
                title ?? 'button app',
                style: textStyle ??
                    context.titleSmall.copyWith(
                      fontSize: 13,
                    ),
              ),
        ),
      ),
    );
  }
}
