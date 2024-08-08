import 'package:flutter/material.dart';

class AppContextService {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static BuildContext get context {
    if (_context == null) {
      throw Exception("Context not set. Call setContext before accessing context.");
    }
    return _context!;
  }
}