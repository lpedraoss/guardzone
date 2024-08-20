// map_screen_helpers.dart
part of 'map_screen.dart';

const double earthRadius = 6371;

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