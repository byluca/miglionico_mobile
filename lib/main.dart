import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

/// Widget di base dell’app: gestisce le rotte
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miglionico Mobile',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/weather': (context) => const WeatherScreen(),
        '/imu': (context) => const IMUScreen(),
        '/schoolCanteen': (context) => const SchoolCanteenScreen(),
        '/schoolTransport': (context) => const SchoolTransportScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/recycling': (context) => const RecyclingScreen(),
        '/reservations': (context) => const ReservationsScreen(),
        '/contacts': (context) => const ContactsScreen(),
        '/pagoPA': (context) => const PagoPAScreen(),
      },
    );
  }
}

/// SCHERMATA DI BENVENUTO (WelcomeScreen)
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5D4037), Color(0xFF3E2723)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Benvenuto a Miglionico!',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/menu');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.brown[700],
                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text('Entra nel Menu'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// MENU PRINCIPALE (MenuScreen)
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Esplora Miglionico',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.brown[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: const Text(
                'Menu Principale',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerTile(context, 'Meteo', FontAwesomeIcons.cloudSun, '/weather'),
            _buildDrawerTile(context, 'IMU IUC TASI', FontAwesomeIcons.moneyCheckDollar, '/imu'),
            _buildDrawerTile(context, 'PagoPA', FontAwesomeIcons.creditCard, '/pagoPA'),
            _buildDrawerTile(context, 'Mensa Scolastica', FontAwesomeIcons.utensils, '/schoolCanteen'),
            _buildDrawerTile(context, 'Trasporto Scolastico', FontAwesomeIcons.bus, '/schoolTransport'),
            _buildDrawerTile(context, 'Valuta Miglionico', FontAwesomeIcons.star, '/feedback'),
            _buildDrawerTile(context, 'Raccolta Differenziata', FontAwesomeIcons.recycle, '/recycling'),
            _buildDrawerTile(context, 'Prenotazioni Servizi', FontAwesomeIcons.calendarCheck, '/reservations'),
            _buildDrawerTile(context, 'Contatti e Info', FontAwesomeIcons.infoCircle, '/contacts'),
          ],
        ),
      ),
      body: Center(
        child: const Text(
          'Benvenuto a Miglionico!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDrawerTile(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.teal),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

/// SCHERMATE NUOVE
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meteo'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Informazioni meteo in tempo reale.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class IMUScreen extends StatelessWidget {
  const IMUScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMU IUC TASI'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Informazioni su IMU, IUC e TASI.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SchoolCanteenScreen extends StatelessWidget {
  const SchoolCanteenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensa Scolastica'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Dettagli sul servizio di mensa scolastica.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class SchoolTransportScreen extends StatelessWidget {
  const SchoolTransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trasporto Scolastico'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Informazioni sul trasporto scolastico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valuta Miglionico'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Lascia il tuo feedback per Miglionico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class RecyclingScreen extends StatelessWidget {
  const RecyclingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raccolta Differenziata'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Guida alla raccolta differenziata a Miglionico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prenotazioni Servizi'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Prenota servizi pubblici comodamente.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class PagoPAScreen extends StatelessWidget {
  const PagoPAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PagoPA'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Collegamento al servizio PagoPA.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatti e Info'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(
        child: Text(
          'Dettagli di contatto e informazioni utili.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
