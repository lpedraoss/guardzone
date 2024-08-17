import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<CircleMarker> heatMapCircles = [];
  List<Marker> crimeMarkers = [];
  LatLng? userLocation;
  bool loadingLocation = true;
  double? _direction; // Dirección de la brújula
  bool _isCompassVisible = false; // Controla la visibilidad de la brújula
  bool _areMarkersVisible = true; // Controla la visibilidad de los marcadores

  @override
  void initState() {
    super.initState();
    _loadAndProcessData();
    _getUserLocation();
    FlutterCompass.events?.listen((CompassEvent event) {
      setState(() {
        _direction = event.heading;
      });
    });
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

      // Crear marcadores para cada ubicación de denuncia
      for (var ubicacion in ubicaciones) {
        crimeMarkers.add(
          Marker(
            width: 40.0, // Tamaño fijo del marcador
            height: 40.0, // Tamaño fijo del marcador
            point: LatLng(ubicacion['lat'], ubicacion['lng']),
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 20.0, // Tamaño fijo del ícono
            ),
          ),
        );
      }
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
        radius: radius,
        borderStrokeWidth: 2,
        useRadiusInMeter: true,
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
    return maxDistance / 2 + peligro * 2.0;
  }

  double _haversineDistance(LatLng point1, LatLng point2) {
    const double earthRadius = 6371;

    double dLat = _toRadians(point2.latitude - point1.latitude);
    double dLng = _toRadians(point2.longitude - point1.longitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(point1.latitude)) *
            cos(_toRadians(point2.latitude)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c * 1000;
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

  Future<void> _getUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();

    setState(() {
      userLocation = LatLng(locationData.latitude!, locationData.longitude!);
      loadingLocation = false;
    });
  }

  void _toggleCompass() {
    setState(() {
      _isCompassVisible = !_isCompassVisible;
    });
  }

  void _toggleMarkersVisibility() {
    setState(() {
      _areMarkersVisible = !_areMarkersVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(4.7110, -74.0721),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              CircleLayer(
                circles: heatMapCircles,
              ),
              if (_areMarkersVisible)
                MarkerLayer(
                  markers: crimeMarkers,
                ),
              if (!loadingLocation && userLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: userLocation!,
                      child: Icon(
                        Icons.person_pin_circle,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          if (_isCompassVisible && _direction != null)
            Positioned(
              right: 10,
              top: 10,
              child: Transform.rotate(
                angle: (_direction! * (pi / 180) * -1),
                child: const Icon(
                  Icons.navigation,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _toggleCompass,
                  child: Icon(
                    _isCompassVisible ? Icons.cancel : Icons.navigation,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _toggleMarkersVisibility,
                  child: Icon(
                    _areMarkersVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
