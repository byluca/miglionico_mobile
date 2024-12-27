import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/WelcomeScreen.dart';
import 'screens/menu/News.dart';
import 'screens/menu/Weather.dart';
import 'screens/menu/Contacts.dart';
import 'screens/menu/Feedback.dart';
import 'screens/menu/MenuScreen.dart';
import 'screens/menu/PagoPA.dart';
import 'screens/menu/Recycling.dart';
import 'screens/menu/Reservations.dart';
import 'screens/menu/SchoolCanteen.dart';
import 'screens/menu/SchoolTransport.dart';



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
      // Rimuovi se non vuoi la scritta "debug" in alto a destra
      debugShowCheckedModeBanner: false,

      // THEME MODIFICATO: palette colori + font + stile globale
      theme: ThemeData(
        // Colore primario dell’app
        primaryColor: const Color(0xFF00796B),
        // Definisci colori base
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00796B),
          secondary: const Color(0xFFFBC02D), // un giallo dorato come secondario
        ),
        // Imposta un font di base
        fontFamily: 'Raleway',

        // Stile dell’AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00796B),
          foregroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Stile dei pulsanti ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(Color(0xFF00796B)),
            foregroundColor:
            MaterialStatePropertyAll<Color>(Colors.white),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            textStyle: const MaterialStatePropertyAll<TextStyle>(
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // Colore di sfondo generale degli Scaffold
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/main': (context) => const MainScreen(),
        '/weather': (context) => const WeatherScreen(), // Usa la NUOVA classe
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
      // L’AppBar ora prende automaticamente i colori dal tema
      appBar: AppBar(
        title: const Text(
          'Notizie e Aggiornamenti',
          // Il fontFamily è già impostato dal ThemeData
        ),
      ),
      drawer: Drawer(
        // Forma arrotondata per il Drawer laterale
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // Gradiente di sfondo nell’header
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00796B),
                    Color(0xFF004D40),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Text(
                'Menu Principale',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
            _buildDrawerTile(context, 'Meteo', FontAwesomeIcons.cloudSun, '/weather'),
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
      body: const NewsScreen(), // Mostra la schermata delle notizie
    );
  }

  Widget _buildDrawerTile(
      BuildContext context,
      String title,
      IconData icon,
      String route
      ) {
    return ListTile(
      // Icone scure (anziché bianche) per risaltare sul Drawer chiaro
      leading: FaIcon(icon, color: Colors.grey[800]),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
















