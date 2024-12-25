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
                    '/history', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'Luoghi da Visitare',
                    FontAwesomeIcons.mapMarkerAlt,
                    Colors.blueAccent,
                    '/places', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'Eventi e Feste',
                    FontAwesomeIcons.calendarAlt,
                    Colors.orange,
                    '/events', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'Dove Mangiare',
                    FontAwesomeIcons.utensils,
                    Colors.redAccent,
                    '/food', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'Notizie e Aggiornamenti',
                    FontAwesomeIcons.newspaper,
                    Colors.green,
                    '/news', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'Acquista Prodotti Locali',
                    FontAwesomeIcons.shoppingBasket,
                    Colors.purple,
                    '/shop', // Assicurati che questa rotta sia definita
                  ),
                  _buildMenuTile(
                    context,
                    'PagoPA',
                    FontAwesomeIcons.creditCard,
                    Colors.green,
                    '/pagoPA', // Aggiungi la rotta per PagoPA
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
