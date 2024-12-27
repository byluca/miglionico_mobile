import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolCanteenScreen extends StatefulWidget {
  const SchoolCanteenScreen({Key? key}) : super(key: key);

  @override
  State<SchoolCanteenScreen> createState() => _SchoolCanteenScreenState();
}

class _SchoolCanteenScreenState extends State<SchoolCanteenScreen> {
  // Per gestire l’espansione/collasso dei pannelli menu
  final List<bool> _expanded = List.generate(8, (_) => false);

  // Link per pagare il buono mensa
  final String canteenPaymentLink = 'https://servizi.comune.miglionico.mt.it/portal/autenticazione';

  // Funzione per aprire il link nel browser di sistema
  Future<void> _launchPaymentLink() async {
    final Uri url = Uri.parse(canteenPaymentLink);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Impossibile aprire il link: $canteenPaymentLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensa Scolastica'),
      ),
      body: Container(
        // Gradiente di sfondo
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1) Card Pagamenti
            _buildPaymentCard(),
            // 2) Card introduttiva Menù Primaria/Infanzia
            _buildIntroCard(
              icon: FontAwesomeIcons.utensils,
              title: 'Menù Refezione Scolastica\na.s. 2024-2025',
              subtitle: 'Scuola Primaria e Infanzia',
            ),
            // 3) I 4 menù settimanali (Primaria/Infanzia)
            _buildMenuExpansion(
              index: 0,
              title: '1° Settimana',
              menuContent: '''
**Lunedì**  
• Pasta tonno e pomodorini  
• Arrosto di tacchino  
• Carote  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pasta al pomodoro  
• Polpette al sugo  
• Bietola  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Risotto con crema di spinaci  
• Frittata con prosciutto  
• Insalata di pomodori  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pasta al pomodoro  
• Arrosto di tacchino fresco  
• Zucchine stufate  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pasta e piselli  
• Bastoncini al forno  
• Purea di patate  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 1,
              title: '2° Settimana',
              menuContent: '''
**Lunedì**  
• Pasta e patate  
• Polpette di merluzzo  
• Fagiolini  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pasta al pomodoro / Pasta e lenticchie  
• Brasato di vitello  
• Carote / Insalata  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Platessa alla mugnaia  
• Crocchette di patate  
• Insalata di pomodori  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Riso e minestrone  
• Cotoletta di pollo al forno  
• Insalata / Zucchine  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Lasagna al forno  
• Formaggio cremoso spalmabile  
• Zucchine stufate  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 2,
              title: '3° Settimana',
              menuContent: '''
**Lunedì**  
• Pasta al tonno  
• Bastoncini al forno  
• Fagiolini e pomodori  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pasta al pomodoro  
• Risotto crema di zucca  
• Hamburgher di vitello  
• Patate al forno  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Frittata  
• Insalata mista / Bietola  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pasta alla bolognese  
• Prosciutto cotto  
• Bietola / Zucchine  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pasta e fagioli  
• Merluzzo gratinato  
• Fagiolini e carote  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 3,
              title: '4° Settimana',
              menuContent: '''
**Lunedì**  
• Pasta e minestrone  
• Insalata mista  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Sartù di riso in bianco  
• Polpette di merluzzo  
• Zucchine stufate  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Pasta e ceci  
• Cotoletta di pollo al forno  
• Insalata di pomodori  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pasta crema di zucchine e prosciutto cotto  
• Brasato di vitello  
• Spinaci  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pasta al pomodoro  
• Scamorza fresca  
• Patate e carote lesse  
• Pane  
• Frutta Fresca di stagione  
''',
            ),

            // 4) Card introduttiva Menù Asilo Nido
            _buildIntroCard(
              icon: FontAwesomeIcons.baby,
              title: 'Menù Refezione Scolastica (Asilo Nido)\na.s. 2024-2025',
              subtitle: '',
            ),
            // 5) Le 4 settimane (Asilo Nido)
            _buildMenuExpansion(
              index: 4,
              title: '1° Settimana (Nido)',
              menuContent: '''
**Lunedì**  
• Riso al pomodoro  
• Frittatina con prosciutto  
• Fagiolini lessi  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pastina con passato di verdure  
• Hamburgher di pollo  
• Carote lesse  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Pastina con crema di piselli  
• Prosciutto cotto  
• Purea di patate  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pastina al pomodoro  
• Polpettine in umido  
• Bietola  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Risotto con crema di spinaci  
• Merluzzo gratinato  
• Carote lesse  
• Pane  
• Frutta Fresca di stagione  

**Sabato**  
• Vitello in umido  
• Spinaci  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 5,
              title: '2° Settimana (Nido)',
              menuContent: '''
**Lunedì**  
• Risotto con crema di zucca  
• Frittatina al forno  
• Crema di spinaci  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pastina alla bolognese  
• Scamorza  
• Zucchine stufate  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Pasta e passato di lenticchie  
• Bastoncini al forno  
• Carote lesse  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Riso al pomodoro  
• Polpettine di vitello  
• Bietola  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pastina e patate  
• Merluzzo a insalata  
• Fagiolini  
• Pane  
• Frutta Fresca di stagione  

**Sabato**  
• Pastina in brodo vegetale  
• Scaloppina di pollo  
• Fagiolini  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 6,
              title: '3° Settimana (Nido)',
              menuContent: '''
**Lunedì**  
• Riso olio e parmigiano  
• Frittatina al forno  
• Crema di spinaci  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Pastina al pomodoro  
• Hamburgher di pollo  
• Purea di patate  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Pastina con passato di verdure  
• Prosciutto cotto  
• Carote lesse  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pastina alla bolognese  
• Polpette di vitello  
• Zucchine stufate  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pastina con crema di ceci  
• Ricotta fresca  
• Spinaci  
• Pane  
• Frutta Fresca di stagione  

**Sabato**  
• Bastoncini al forno  
• Fagiolini  
• Pane  
• Frutta Fresca di stagione  
''',
            ),
            _buildMenuExpansion(
              index: 7,
              title: '4° Settimana (Nido)',
              menuContent: '''
**Lunedì**  
• Pastina con passato di verdure  
• Hamburgher di pollo  
• Patate lesse  
• Pane  
• Frutta Fresca di stagione  

**Martedì**  
• Riso alla bolognese  
• Ricotta fresca  
• Fagiolini lessi  
• Pane  
• Frutta Fresca di stagione  

**Mercoledì**  
• Pastina con crema di fagioli  
• Frittatina con prosciutto  
• Bietola  
• Pane  
• Frutta Fresca di stagione  

**Giovedì**  
• Pastina al pomodoro  
• Scaloppina di pollo  
• Spinaci  
• Pane  
• Frutta Fresca di stagione  

**Venerdì**  
• Pastina con passato di verdure  
• Vitello in umido  
• Carote  
• Pane  
• Frutta Fresca di stagione  

**Sabato**  
• Pastina e patate  
• Scamorza  
• Carote  
• Pane  
• Frutta Fresca di stagione  
''',
            ),

            // Card finale: Avviso e dettagli
            _buildAvvisoCard(),
          ],
        ),
      ),
    );
  }

  /// Card con il link per pagare i buoni mensa
  Widget _buildPaymentCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FaIcon(FontAwesomeIcons.creditCard, size: 40, color: Colors.teal[700]),
            const SizedBox(height: 12),
            const Text(
              'Pagamenti Buoni Mensa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Clicca per accedere alla piattaforma e ricaricare i buoni mensa.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, height: 1.3),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.payment),
              label: const Text('Paga Buoni Mensa'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _launchPaymentLink,
            ),
          ],
        ),
      ),
    );
  }

  /// Card introduttiva per i menù (Primaria, Nido ecc.)
  Widget _buildIntroCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FaIcon(icon, size: 40, color: Colors.teal[700]),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Costruisce un pannello espandibile per mostrare il menù settimanale
  Widget _buildMenuExpansion({
    required int index,
    required String title,
    required String menuContent,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 300),
        elevation: 0, // l'elevazione la gestisce la Card
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            _expanded[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                  ),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                menuContent.trim(),
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
            ),
            isExpanded: _expanded[index],
            canTapOnHeader: true,
          ),
        ],
      ),
    );
  }

  /// Card con l’avviso finale riguardo l’inizio del servizio e i costi
  Widget _buildAvvisoCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'AVVISO - REFEZIONE SCOLASTICA 2024/2025',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '''
• Il servizio di refezione scolastica inizia lunedì 14.10.2024 per la scuola primaria, infanzia e nido. 
• Il costo del buono mensa è di 3,90 €.
• I pagamenti si effettuano mediante SPID al link:
  https://servizi.comune.miglionico.mt.it/portal/autenticazione
  (Tutti i servizi → Servizi su richiesta → Nome bambino/a → Vai alla pagina).
• Il pasto è prenotato in automatico: la disdetta deve avvenire entro le 09:30 del giorno corrente.
• Per intolleranze, allergie o diete religiose inviare certificato medico a amministrativo@comune.miglionico.mt.it
• Per chiarimenti: ufficio amministrativo o mail amministrativo@comune.miglionico.mt.it
''',
              style: TextStyle(height: 1.3),
            ),
            const SizedBox(height: 8),
            const Text(
              'Il Resp. dell’Area Amministrativa\nF.to Dott.ssa Lucia Asprella',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
