import 'package:flutter/material.dart';
import 'package:guardzone/app/home/home_screen.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is| the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GuardZone',
      theme: getGuardZoneDarkTheme(),
      home: const HomeScreen(),
    );
  }
}
