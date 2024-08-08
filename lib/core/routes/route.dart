library;
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class Routes {
  static const index = '/';
  static const home = index; // Asociar "home" a "index"
}

class IndexRoutes {
  static String get home {
    return Routes.home; // Utilizar la ruta "home" asociada a "index"
  }
}
