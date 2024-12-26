import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
      // Rotta iniziale
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/history': (context) => const HistoryScreen(),
        '/places': (context) => const PlacesScreen(),
        '/events': (context) => const EventsScreen(),
        '/food': (context) => const FoodScreen(),
        '/news': (context) => const NewsScreen(),
        '/shop': (context) => const ShopScreen(),
        '/pagoPA': (context) => const PagoPAScreen(),
        '/contacts': (context) => const ContactsScreen(),
        '/about': (context) => const AboutScreen(),
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
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Ciao!',
                      textStyle: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                    TypewriterAnimatedText(
                      'Benvenuto a Miglionico!',
                      textStyle: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/menu');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.brown[700],
                    padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
            _buildDrawerTile(context, 'Storia di Miglionico',
                FontAwesomeIcons.book, '/history'),
            _buildDrawerTile(context, 'Luoghi da Visitare',
                FontAwesomeIcons.mapMarkerAlt, '/places'),
            _buildDrawerTile(context, 'Eventi e Feste',
                FontAwesomeIcons.calendarAlt, '/events'),
            _buildDrawerTile(context, 'Dove Mangiare',
                FontAwesomeIcons.utensils, '/food'),
            _buildDrawerTile(context, 'Notizie e Aggiornamenti',
                FontAwesomeIcons.newspaper, '/news'),
            _buildDrawerTile(context, 'Acquista Prodotti Locali',
                FontAwesomeIcons.shoppingBasket, '/shop'),
            _buildDrawerTile(context, 'PagoPA',
                FontAwesomeIcons.creditCard, '/pagoPA'),
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

  Widget _buildDrawerTile(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.teal),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

/// SCHERMATA HISTORY
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storia di Miglionico'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text('Un po\' di storia...'),
      ),
    );
  }
}

/// Altre schermate seguono lo stesso schema (PlacesScreen, EventsScreen, ecc.)
// Implementa tutte le schermate per le rotte già definite sopra.

/// SCHERMATA PLACES
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luoghi da Visitare'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text(
          'Qui puoi mostrare i luoghi da visitare a Miglionico!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA EVENTS
class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventi e Feste'),
        backgroundColor: Colors.brown[900],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            title: 'Festa Medievale',
            date: '12 Dicembre 2024',
            description: 'Un tuffo nel passato con costumi e spettacoli medievali.',
          ),
          const SizedBox(height: 16),
          _buildEventCard(
            title: 'Sagra del Pane',
            date: '18 Gennaio 2025',
            description: 'Degustazione di pane tradizionale e prodotti locali.',
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// SCHERMATA FOOD
class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dove Mangiare'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text(
          'Qui puoi mostrare una lista di ristoranti, pizzerie e trattorie locali.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA NEWS
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notizie e Aggiornamenti'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text(
          'Qui puoi inserire le ultime notizie su Miglionico e gli aggiornamenti per i cittadini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA SHOP
class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acquista Prodotti Locali'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text(
          'Elenco di prodotti locali disponibili per l\'acquisto.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA PAGOPA
class PagoPAScreen extends StatefulWidget {
  const PagoPAScreen({Key? key}) : super(key: key);

  @override
  State<PagoPAScreen> createState() => _PagoPAScreenState();
}

class _PagoPAScreenState extends State<PagoPAScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PagoPA'),
        backgroundColor: Colors.brown[900],
      ),
      body: WebView(
        initialUrl:
        'https://applicazioni.regione.basilicata.it/pagamentionline/indexEnte.jsp?ente=80002950774',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}

/// SCHERMATA CONTATTI
class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatti'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Center(
        child: Text(
          'Elenco dei contatti del Comune di Miglionico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA ABOUT
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Miglionico Mobile'),
        backgroundColor: Colors.brown[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage:
                NetworkImage('https://via.placeholder.com/120'),
              ),
              SizedBox(height: 20),
              Text(
                'Miglionico Mobile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Un\'app dedicata a cittadini e turisti per scoprire Miglionico.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

