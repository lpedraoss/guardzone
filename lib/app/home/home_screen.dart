import 'package:flutter/material.dart';
import 'package:guardzone/core/presentation/widgets/card_app.dart';
import 'package:guardzone/core/presentation/widgets/scafold_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: CardApp(
          size: 200,
          child: Column(
            children: [
              Text('Home Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
