class CrimeAlert {
  final String title;
  final String barrio;
  final String descripcion;
  final String hora;
  final String fecha;
  final double lat;
  final double lng;

  CrimeAlert({
    required this.title,
    required this.barrio,
    required this.descripcion,
    required this.hora,
    required this.fecha,
    required this.lat,
    required this.lng,
  });
}