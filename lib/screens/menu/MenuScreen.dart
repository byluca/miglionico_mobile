import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _colorAnimation1 = ColorTween(
      begin: Colors.brown[300],
      end: Colors.teal[300],
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: Colors.orange[300],
      end: Colors.purple[300],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Esplora Miglionico',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.brown[900],
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: const Text(
                'Menu Principale',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerTile(
              context,
              'Meteo',
              FontAwesomeIcons.cloudSun,
              '/weather',
            ),
            _buildDrawerTile(
              context,
              'IMU IUC TASI',
              FontAwesomeIcons.moneyCheckDollar,
              '/imu',
            ),
            _buildDrawerTile(
              context,
              'PagoPA',
              FontAwesomeIcons.creditCard,
              '/pagoPA',
            ),
            _buildDrawerTile(
              context,
              'Mensa Scolastica',
              FontAwesomeIcons.utensils,
              '/schoolCanteen',
            ),
            _buildDrawerTile(
              context,
              'Trasporto Scolastico',
              FontAwesomeIcons.bus,
              '/schoolTransport',
            ),
            _buildDrawerTile(
              context,
              'Valuta Miglionico',
              FontAwesomeIcons.star,
              '/feedback',
            ),
            _buildDrawerTile(
              context,
              'Raccolta Differenziata',
              FontAwesomeIcons.recycle,
              '/recycling',
            ),
            _buildDrawerTile(
              context,
              'Prenotazioni Servizi',
              FontAwesomeIcons.calendarCheck,
              '/reservations',
            ),
            _buildDrawerTile(
              context,
              'Contatti e Info',
              FontAwesomeIcons.infoCircle,
              '/contacts',
            ),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _colorAnimation1.value ?? Colors.brown,
                  _colorAnimation2.value ?? Colors.orange,
                ],
              ),
            ),
            child: Center(
              child: const Text(
                'Benvenuto a Miglionico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerTile(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: Colors.teal,
      ),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
