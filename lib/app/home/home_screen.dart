import 'package:flutter/material.dart';
import 'package:guardzone/app/map/map_screen.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';
import 'package:guardzone/core/presentation/widgets/scafold_app.dart';
import 'package:guardzone/app/chat/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MapScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Zona de Guardianes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: context.greenColors['500'], // Usar color del tema
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: context.greenColors['700'], // Usar color del tema
        unselectedItemColor: context.greenColors['200'], // Usar color del tema
        backgroundColor: context.greenColors['50'], // Usar color del tema
        onTap: _onItemTapped,
      ),
    );
  }
}
