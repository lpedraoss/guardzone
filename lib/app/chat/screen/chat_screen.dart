import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:guardzone/app/chat/domain/models/crime_alert.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';
import 'package:guardzone/core/presentation/widgets/card_app.dart';
import 'package:geocoding/geocoding.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  Future<List<CrimeAlert>> _loadCrimeAlerts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/zone.json');
      final List<dynamic> data = json.decode(response);

      List<CrimeAlert> alerts = [];
      for (var item in data) {
        String barrio = item['barrio'];
        for (var ubicacion in item['ubicaciones']) {
          alerts.add(CrimeAlert(
            title: ubicacion['crimen'],
            barrio: barrio,
            descripcion: ubicacion['descripcion'],
            hora: ubicacion['hora'],
            fecha: ubicacion['fecha'],
            lat: ubicacion['lat'],
            lng: ubicacion['lng'],
          ));
        }
      }
      return alerts;
    } catch (e) {
      print('Error al cargar datos: $e');
      return [];
    }
  }

  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        return '${place.street}, ${place.locality}, ${place.country}';
      }
      return 'Dirección no disponible';
    } catch (e) {
      print('Error al obtener dirección: $e');
      return 'Dirección no disponible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CrimeAlert>>(
      future: _loadCrimeAlerts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al cargar datos'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay alertas disponibles'));
        } else {
          final alerts = snapshot.data!;
          return ListView.builder(
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              final alert = alerts[index];
              return FutureBuilder<String>(
                future: _getAddressFromLatLng(alert.lat, alert.lng),
                builder: (context, addressSnapshot) {
                  if (addressSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (addressSnapshot.hasError) {
                    return const Center(
                        child: Text('Error al obtener dirección'));
                  } else {
                    final address =
                        addressSnapshot.data ?? 'Dirección no disponible';
                    return CardApp(
                      padding: const EdgeInsets.all(8.0),
                      paddingCard: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Barrio: ${alert.barrio}',
                            style: TextStyle(
                              color: context.redColors['50'],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Fecha: ${alert.fecha}',
                            style: TextStyle(
                              color: context.greenColors['50'],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          ListTile(
                            title: Text(
                              alert.title,
                              style: TextStyle(
                                color: context.redColors['50'],
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              'Descripción: ${alert.descripcion}\nHora: ${alert.hora}\nUbicación: $address',
                              style:
                                  TextStyle(color: context.greenColors['50']),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up,
                                    color: context.redColors['50']),
                                onPressed: () {
                                  // Acción de "Me gusta"
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.share,
                                    color: context.greenColors['50']),
                                onPressed: () {
                                  // Acción de "Compartir"
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}
