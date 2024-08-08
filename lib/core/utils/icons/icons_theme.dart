// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class IconInterface {
  Widget build(BuildContext context);
  IconInterface copyWith({
    double? size,
    double? height,
    double? width,
  });
}

extension IconsTheme on BuildContext {
  ///Icon user
  Widget get user => const IconUser();

  ///Icon Logo
  Widget get logo => const IconLogo();

  
}

class IconUser extends StatelessWidget implements IconInterface {
  const IconUser({super.key, this.size, this.height, this.width});
  final double? size, height, width;
  @override
  IconInterface copyWith({
    double? size,
    double? height,
    double? width,
  }) {
    return IconUser(
      size: size ?? this.size,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? width ?? 10,
      height: size ?? height ?? 10,
      padding: const EdgeInsets.only(
        top: 1.67,
        left: 1.66,
      ),
      child: SvgPicture.asset(
        'assets/svg/user.svg',
      ),
    );
  }
}

class IconLogo extends StatelessWidget {
  const IconLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/png/logo.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

