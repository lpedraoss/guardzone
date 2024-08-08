import 'package:flutter/material.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';


class ScaffoldApp extends StatefulWidget {
  const ScaffoldApp({
    super.key,
    required this.body,
    this.appBar,
    this.bodyPadding,
    this.gradient,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.withGradient,
    this.drawer,
  });
  final PreferredSizeWidget? appBar;
  final EdgeInsets? bodyPadding;
  final Widget body;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool? withGradient;
  final Widget? bottomNavigationBar, drawer;

  @override
  State<ScaffoldApp> createState() => _ScaffoldAppState();
}

class _ScaffoldAppState extends State<ScaffoldApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          gradient: (widget.withGradient ?? true) == true
              ? widget.gradient ?? context.primary_gradient
              : null,
        ),
        child: Scaffold(
          drawer: widget.drawer,
          appBar: widget.appBar,
          backgroundColor: widget.backgroundColor ?? Colors.transparent,
          body: Padding(
            padding: widget.bodyPadding ?? EdgeInsets.zero,
            child: widget.body,
          ),
          bottomNavigationBar: widget.bottomNavigationBar,
        ),
      ),
    );
  }
}
