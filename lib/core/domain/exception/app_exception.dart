// Excepción general de la aplicación
class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}
class ConnectivityException extends AppException {
  ConnectivityException(super.message);
}