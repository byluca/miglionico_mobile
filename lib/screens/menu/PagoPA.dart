import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PagoPAScreen extends StatelessWidget {
  const PagoPAScreen({Key? key}) : super(key: key);

  // Link da aprire
  final String pagoPALink = 'https://applicazioni.regione.basilicata.it/'
      'pagamentionline/indexEnte.jsp?ente=80002950774';

  // Funzione per aprire il link nel browser di sistema
  Future<void> _launchPagoPALink() async {
    final Uri url = Uri.parse(pagoPALink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Impossibile aprire il link: $pagoPALink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con titolo
      appBar: AppBar(
        title: const Text('PagoPA'),
      ),
      // Usiamo un Container con gradiente di sfondo
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00897B),
              Color(0xFF00796B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Centriamo il contenuto
        child: Center(
          // Card “accattivante” con un po’ di ombra e angoli arrotondati
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icona stilosa in cima
                  FaIcon(
                    FontAwesomeIcons.creditCard,
                    size: 60,
                    color: Colors.teal[600],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Collegamento al servizio PagoPA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Paga i tuoi tributi e servizi in modo semplice e sicuro.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'Vai a PagoPA',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _launchPagoPALink,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
