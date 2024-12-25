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
        // Rotta che punta alla WelcomeScreen (schermata di benvenuto)
        '/': (context) => const WelcomeScreen(),

        // Rotta che punta al MenuScreen
        '/menu': (context) => const MenuScreen(),

        // Altre rotte: le classi corrispondenti sono definite sotto
        '/history': (context) => const HistoryScreen(),
        '/places': (context) => const PlacesScreen(),
        '/events': (context) => const EventsScreen(),
        '/food': (context) => const FoodScreen(),
        '/news': (context) => const NewsScreen(),
        '/shop': (context) => const ShopScreen(),
        '/pagoPA': (context) => const PagoPAScreen(),

        // Esempi di altre schermate se vuoi
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
      // Contenitore con gradiente di sfondo
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5D4037), Color(0xFF3E2723)], // gradiente marrone
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
                // Testo Animato
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
                // Pulsante che porta al Menu
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/menu');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,  // sfondo pulsante
                    foregroundColor: Colors.brown[700],  // testo pulsante
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

/// MENU PRINCIPALE (MenuScreen) - (Il tuo VECCHIO CODICE)
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuTile(
                    context,
                    'Storia di Miglionico',
                    FontAwesomeIcons.book,
                    Colors.teal,
                    '/history',
                  ),
                  _buildMenuTile(
                    context,
                    'Luoghi da Visitare',
                    FontAwesomeIcons.mapMarkerAlt,
                    Colors.blueAccent,
                    '/places',
                  ),
                  _buildMenuTile(
                    context,
                    'Eventi e Feste',
                    FontAwesomeIcons.calendarAlt,
                    Colors.orange,
                    '/events',
                  ),
                  _buildMenuTile(
                    context,
                    'Dove Mangiare',
                    FontAwesomeIcons.utensils,
                    Colors.redAccent,
                    '/food',
                  ),
                  _buildMenuTile(
                    context,
                    'Notizie e Aggiornamenti',
                    FontAwesomeIcons.newspaper,
                    Colors.green,
                    '/news',
                  ),
                  _buildMenuTile(
                    context,
                    'Acquista Prodotti Locali',
                    FontAwesomeIcons.shoppingBasket,
                    Colors.purple,
                    '/shop',
                  ),
                  _buildMenuTile(
                    context,
                    'PagoPA',
                    FontAwesomeIcons.creditCard,
                    Colors.green,
                    '/pagoPA',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuTile(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      String route,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Un po\' di storia...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA PLACES (esempio “Luoghi da Visitare”)
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
        child: Text('Qui puoi mostrare i luoghi da visitare a Miglionico!'),
      ),
    );
  }
}

/// SCHERMATA EVENTS
class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  Widget _buildEventCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventi'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            title: 'Festa Medievale',
            date: '12 Dicembre 2024',
            description: 'Un tuffo nel passato con costumi e spettacoli.',
          ),
          const SizedBox(height: 16),
          _buildEventCard(
            title: 'Sagra del Pane',
            date: '18 Gennaio 2025',
            description: 'Degustazione di pane tradizionale.',
          ),
        ],
      ),
    );
  }
}

/// SCHERMATA FOOD (esempio “Dove Mangiare”)
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
        child: Text('Lista dei ristoranti, pizzerie, ecc.'),
      ),
    );
  }
}

/// SCHERMATA NEWS (esempio “Notizie e Aggiornamenti”)
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
        child: Text('Qui inserisci le ultime notizie su Miglionico.'),
      ),
    );
  }
}

/// SCHERMATA SHOP (esempio “Acquista Prodotti Locali”)
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
        child: Text('Elenco di prodotti locali da acquistare.'),
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
    // Se hai bisogno di impostare la piattaforma per la WebView su Android
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PagoPA"),
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

/// SCHERMATA CONTATTI (facoltativa)
class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatti'),
        backgroundColor: Colors.brown,
      ),
      body: const Center(
        child: Text(
          'Questa è la schermata dei Contatti!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// SCHERMATA ABOUT (facoltativa)
class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Non ho messo un AppBar qui, ma puoi aggiungerla se vuoi
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
                'Un\'app per scoprire eventi e storie su Miglionico.',
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
