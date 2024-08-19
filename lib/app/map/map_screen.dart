import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' show sin, cos, sqrt, atan2;
import 'package:location/location.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<String> _searchOptions = [];
  List<CircleMarker> heatMapCircles = [];
  List<Marker> crimeMarkers = [];
  LatLng? userLocation;
  bool loadingLocation = true;
  double? _direction;
  bool _isCompassVisible = false;
  bool _areMarkersVisible = false;
  final MapController _mapController = MapController();
  final LatLng _initialPosition = const LatLng(4.7110, -74.0721);
  Polyline? _routeLine;
  String _address = '';
  LatLng? _destination;
  String _travelMode = 'driving';

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

      for (var ubicacion in ubicaciones) {
        crimeMarkers.add(
          Marker(
            width: 40.0,
            height: 40.0,
            point: LatLng(ubicacion['lat'], ubicacion['lng']),
            child: const Icon(
              Icons.location_on,
              color: Colors.red,
              size: 20.0,
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
    return maxDistance + peligro * 10.0;
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
    double normalizedPeligro = (peligro / 10).clamp(0.0, 1.0);
    int red = 255;
    int green = (255 * (1 - normalizedPeligro)).toInt();

    return Color.fromARGB(255, red, green, 0);
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

  Future<void> _geocodeAddress(String address) async {
    final String url =
        'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(address)}&format=json&limit=1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse.isNotEmpty) {
        final location = jsonResponse[0];
        setState(() {
          _destination = LatLng(
              double.parse(location['lat']), double.parse(location['lon']));
        });
        if (userLocation != null && _destination != null) {
          _getRoute(userLocation!, _destination!, _travelMode);
        }
      } else {
        // Manejar el caso en el que la dirección no se puede geocodificar
        print('Dirección no encontrada');
      }
    } else {
      // Manejar el error en caso de que la solicitud falle
      print('Error al geocodificar la dirección: ${response.statusCode}');
    }
  }

// Ejemplo de implementación de la función _fetchSearchOptions
  Future<List<String>> _fetchSearchOptions(String query) async {
    final String url =
        'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(query)}&format=json&addressdetails=1';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((item) => item['display_name'] as String)
          .toList();
    } else {
      // Manejar el error en caso de que la solicitud falle
      print('Error al obtener opciones de búsqueda: ${response.statusCode}');
      return [];
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end, String mode) async {
    final String baseUrl = 'http://router.project-osrm.org/route/v1';
    final String url =
        '$baseUrl/$mode/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final geometry =
          jsonResponse['routes'][0]['geometry']['coordinates'] as List;
      final List<LatLng> polylinePoints = geometry.map((point) {
        return LatLng(point[1], point[0]);
      }).toList();

      setState(() {
        _routeLine = Polyline(
          points: polylinePoints,
          strokeWidth: 4.0,
          color: Colors.blue,
        );
      });
    } else {
      // Manejar el error en caso de que la solicitud falle
      print('Error al obtener la ruta: ${response.statusCode}');
    }
  }

  void _resetMapPosition() {
    _mapController.move(_initialPosition, 13.0);
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

  void _onTravelModeChanged(String? mode) {
    setState(() {
      _travelMode = mode ?? 'driving';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barra de búsqueda y selección de modo de viaje
        Container(
          color: Theme.of(context)
              .appBarTheme
              .backgroundColor, // Usar color del tema
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(
                      color: Colors
                          .black), // Establecer el color del texto en negro
                  onSubmitted: (value) {
                    _geocodeAddress(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar dirección...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _geocodeAddress(_address);
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _travelMode,
                items: const [
                  DropdownMenuItem(
                    value: 'driving',
                    child: Row(
                      children: [
                        Icon(Icons.directions_car),
                        SizedBox(width: 8),
                        Text('Automóvil'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'walking',
                    child: Row(
                      children: [
                        Icon(Icons.directions_walk),
                        SizedBox(width: 8),
                        Text('A pie'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'cycling',
                    child: Row(
                      children: [
                        Icon(Icons.directions_bike),
                        SizedBox(width: 8),
                        Text('Bicicleta'),
                      ],
                    ),
                  ),
                ],
                onChanged: _onTravelModeChanged,
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _initialPosition,
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
                          child: const Icon(
                            Icons.person_pin_circle,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  if (_routeLine != null)
                    PolylineLayer(
                      polylines: [_routeLine!],
                    ),
                ],
              ),
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                child: Column(
                  children: [
                    if (_searchOptions.isNotEmpty)
                      Container(
                        color: Colors.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _searchOptions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_searchOptions[index]),
                              onTap: () {
                                setState(() {
                                  _address = _searchOptions[index];
                                  _searchOptions.clear();
                                });
                                _geocodeAddress(_address);
                              },
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              if (_isCompassVisible && _direction != null)
                Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.navigation, color: Colors.white),
                        Text(
                          '${_direction!.toStringAsFixed(0)}°',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 50,
                right: 20,
                child: Column(
                  children: [
                    FloatingActionButton(
                      onPressed: _resetMapPosition,
                      child: const Icon(Icons.location_searching),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: _toggleCompass,
                      child: const Icon(Icons.explore),
                    ),
                    const SizedBox(height: 10),
                    FloatingActionButton(
                      onPressed: _toggleMarkersVisibility,
                      child: const Icon(Icons.layers),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
