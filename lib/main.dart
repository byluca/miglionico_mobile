import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/WelcomeScreen.dart';
import 'screens/menu/News.dart';

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
        '/': (context) => const WelcomeScreen(), // Schermata iniziale
        '/main': (context) => const MainScreen(), // Schermata principale con menu e notizie
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

/// Schermata principale con NewsScreen e Menu laterale
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notizie e Aggiornamenti',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
        backgroundColor: Colors.teal,
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
      body: const NewsScreen(), // Mostra la schermata delle notizie come contenuto principale
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
