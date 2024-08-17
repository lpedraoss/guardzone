import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' show sin, cos, sqrt, atan2;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<CircleMarker> heatMapCircles = [];

  @override
  void initState() {
    super.initState();
    _loadAndProcessData();
  }

  Future<void> _loadAndProcessData() async {
    String data = await rootBundle.loadString('assets/data/zone.json');
    List<dynamic> jsonResult = json.decode(data);

    Map<String, dynamic> barrios = {};
    for (var barrioData in jsonResult) {
      String barrio = barrioData['barrio'];
      List<dynamic> ubicaciones = barrioData['ubicaciones'];

      if (!barrios.containsKey(barrio)) {
        barrios[barrio] = {'cantidadDenuncias': 0, 'ubicaciones': []};
      }

      barrios[barrio]['cantidadDenuncias'] += ubicaciones.length;
      barrios[barrio]['ubicaciones'].addAll(ubicaciones);
    }

    heatMapCircles = barrios.entries.map((entry) {
      double peligro = entry.value['cantidadDenuncias'].toDouble();
      LatLng posicionPromedio =
          _calcularPosicionPromedio(entry.value['ubicaciones']);
      Color color = _getColorForDangerLevel(peligro);

      double radius = _calculateRadius(entry.value['ubicaciones'], peligro);

      return CircleMarker(
        point: posicionPromedio,
        color: color.withOpacity(0.5),
        radius: radius, // Radio en metros
        borderStrokeWidth: 2,
        useRadiusInMeter: true, // Mantener el tamaño fijo en metros
      );
    }).toList();

    setState(() {});
  }

  LatLng _calcularPosicionPromedio(List<dynamic> ubicaciones) {
    double latSum = 0;
    double lngSum = 0;
    for (var ubicacion in ubicaciones) {
      latSum += ubicacion['lat'];
      lngSum += ubicacion['lng'];
    }
    return LatLng(latSum / ubicaciones.length, lngSum / ubicaciones.length);
  }

  double _calculateRadius(List<dynamic> ubicaciones, double peligro) {
    double maxDistance = 0;
    for (var i = 0; i < ubicaciones.length; i++) {
      for (var j = i + 1; j < ubicaciones.length; j++) {
        double distance = _haversineDistance(
          LatLng(ubicaciones[i]['lat'], ubicaciones[i]['lng']),
          LatLng(ubicaciones[j]['lat'], ubicaciones[j]['lng']),
        );
        if (distance > maxDistance) {
          maxDistance = distance;
        }
      }
    }

    // Ajusta el radio según el peligro y la extensión del barrio
    return maxDistance / 2 + peligro * 2.0; // El radio estará en metros
  }

  double _haversineDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371; // Radius of the Earth in kilometers

    double dLat = _toRadians(point2.latitude - point1.latitude);
    double dLng = _toRadians(point2.longitude - point1.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(point1.latitude)) *
            cos(_toRadians(point2.latitude)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c * 1000; // Distance in meters
  }

  double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  Color _getColorForDangerLevel(double peligro) {
    if (peligro > 10) {
      return Colors.red;
    } else if (peligro > 5) {
      return Colors.redAccent;
    } else if (peligro > 2) {
      return Colors.orange;
    } else {
      return Colors.yellow.withOpacity(0.7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(4.7110, -74.0721),
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        CircleLayer(
          circles: heatMapCircles,
        ),
      ],
    );
  }
}
