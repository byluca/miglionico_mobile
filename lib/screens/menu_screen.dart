import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  // Indice selezionato per il BottomNavigationBar
  int _selectedIndex = 0;

  // Handler per il cambio di tab nel BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Qui puoi gestire la navigazione in base al valore di index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar leggermente personalizzata
      appBar: AppBar(
        title: const Text('Benvenuto a Miglionico!'),
        backgroundColor: Colors.brown[600],
        elevation: 4,
      ),
      // Corpo della schermata con uno sfondo personalizzato
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD7CCC8), Color(0xFFBCAAA4)], // gradiente chiaro
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // Inseriamo un leggero fadeIn
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 2),
                builder: (context, double opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
                child: const Text(
                  'Ciao! Benvenuto a Miglionico!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Scopri le meraviglie storiche e culturali del nostro borgo.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Qui aggiungiamo un effetto di "scale in" sui pulsanti
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildAnimatedMenuButton(
                      context,
                      title: 'Storia di Miglionico',
                      icon: Icons.history,
                      delay: 0.2,
                      onTap: () {
                        // Naviga alla schermata "Storia di Miglionico"
                      },
                    ),
                    _buildAnimatedMenuButton(
                      context,
                      title: 'Luoghi da Visitare',
                      icon: Icons.location_on,
                      delay: 0.4,
                      onTap: () {
                        // Naviga alla schermata "Luoghi da Visitare"
                      },
                    ),
                    _buildAnimatedMenuButton(
                      context,
                      title: 'Eventi e Feste',
                      icon: Icons.event,
                      delay: 0.6,
                      onTap: () {
                        // Naviga alla schermata "Eventi e Feste"
                      },
                    ),
                    _buildAnimatedMenuButton(
                      context,
                      title: 'Dove Mangiare',
                      icon: Icons.restaurant,
                      delay: 0.8,
                      onTap: () {
                        // Naviga alla schermata "Dove Mangiare"
                      },
                    ),
                    _buildAnimatedMenuButton(
                      context,
                      title: 'Contatti e Info',
                      icon: Icons.info,
                      delay: 1.0,
                      onTap: () {
                        // Naviga alla schermata "Contatti e Info"
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // BottomNavigationBar con l'indice gestito da _selectedIndex
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Eventi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mappa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        selectedItemColor: Colors.brown[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  // Costruiamo un pulsante animato per il menu
  Widget _buildAnimatedMenuButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
        required double delay,
      }) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.8, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      // Usiamo un Delay basato su un Future.delayed
      child: FutureBuilder<void>(
        future: Future.delayed(Duration(milliseconds: (delay * 1000).round())),
        builder: (context, snapshot) {
          // Quando il future è completato, mostriamo il pulsante
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildMenuButton(
              context,
              title: title,
              icon: icon,
              onTap: onTap,
            );
          } else {
            // Nel frattempo, mettiamo un Container “invisibile” (o un placeholder)
            return const SizedBox(height: 0);
          }
        },
      ),
    );
  }

  // Pulsante classico (ma personalizzato con stile)
  Widget _buildMenuButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
        ),
        onPressed: onTap,
        icon: Icon(icon, size: 24),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
