import 'package:flutter/material.dart';
import 'package:guardzone/app/map/map_screen.dart';

import 'package:guardzone/core/presentation/widgets/scafold_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appBar: AppBar(
        title: const Text('Zona de Guardianes'),
      ),
      body: const MapScreen()
    );
  }
}
