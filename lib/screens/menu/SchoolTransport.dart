import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolTransportScreen extends StatelessWidget {
  const SchoolTransportScreen({Key? key}) : super(key: key);

  // Link per l’iscrizione/pagamenti trasporto scolastico
  final String _registrationLink = 'https://servizi.comune.miglionico.mt.it/portal/autenticazione/?redirect=%2Fportal%2Fservizi%2Fmoduli%2F296%2Fmodulo';
  // File .docx (delega ritiro)
  final String _docLink = 'https://www.comune.miglionico.mt.it/attachments/article/3987/delega-ritiro%20-%20alunno-2024-2025.docx';
  // Email e recapito telefonico
  final String _mailTo = 'mailto:amministrativo@comune.miglionico.mt.it';
  final String _phone = 'tel:0835559005';

  // Funzione per aprire un link nel browser di sistema
  Future<void> _launchLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Impossibile aprire il link: $url';
    }
  }

  // Funzione per aprire l’app telefono (chiamata)
  Future<void> _launchPhone(String phoneUrl) async {
    final Uri uri = Uri.parse(phoneUrl);
    if (!await launchUrl(uri)) {
      throw 'Impossibile chiamare: $phoneUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trasporto Scolastico'),
      ),
      // Sfondo con gradiente
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
        // ListView per scorrere il contenuto se è lungo
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          children: [
            // Card 1: Titolo/Avviso
            _buildCard(
              icon: FontAwesomeIcons.bus,
              title: 'AVVISO',
              content: '''
Servizio di Trasporto Scolastico rivolto agli alunni delle scuole dell’Infanzia, Primaria e Secondaria di I grado di Miglionico A.S. 2024/2025.\n
- Iscrizioni aperte fino al 12 settembre 2024 (ore 12:00).
- Il servizio è annuale: settembre 2024 – giugno 2025.
- Non sono previste riduzioni per solo andata o solo ritorno.
- Chi è moroso per l’anno 2023/2024 non potrà accedere al servizio.
              ''',
            ),

            // Card 2: Istruzioni iscrizione
            _buildCard(
              icon: FontAwesomeIcons.clipboardList,
              title: 'Istruzioni per l’iscrizione',
              content: '''
1. Clicca sul pulsante in basso per registrarti/accedere (Nome utente e Password).
2. Una volta autenticati: 
   - Andare su "Istanze online" → "Iscrizioni Trasporto Scolastico" 
   - Inserire le generalità del bambino e i documenti richiesti (Carta d’identità e ISEE).
3. Al termine, se appare il messaggio di conferma, l’istanza è inviata correttamente.
              ''',
              buttonLabel: 'Iscrizione online',
              buttonIcon: Icons.login,
              buttonAction: () => _launchLink(_registrationLink),
            ),

            // Card 3: Pagamenti
            _buildCard(
              icon: FontAwesomeIcons.moneyBillWave,
              title: 'Pagamenti',
              content: '''
Per effettuare i pagamenti:
- Accedi allo stesso link "Iscrizione online" → voce "PAGAMENTI".
- Pagamenti spontanei → selezionare Trasporto Scolastico e tipologia di scuola.
- Inserire la causale (nome del bambino e il mese di riferimento) e l’importo.
              ''',
              buttonLabel: 'Vai ai pagamenti',
              buttonIcon: Icons.payment,
              buttonAction: () => _launchLink(_registrationLink),
            ),

            // Card 4: Tariffe
            _buildTariffeCard(),

            // Card 5: Contatti e Orari
            _buildCard(
              icon: FontAwesomeIcons.phone,
              title: 'Contatti e Orari',
              content: '''
Ufficio Amministrativo:
- Dal lunedì al venerdì: 09:00 – 11:30
- Lunedì e mercoledì: 16:00 – 17:00
Telefono: 0835 559005
Email: amministrativo@comune.miglionico.mt.it
              ''',
              // Due pulsanti: Chiamata e Email
              extraButtons: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.phone),
                    label: const Text('Chiama'),
                    onPressed: () => _launchPhone(_phone),
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email),
                    label: const Text('Email'),
                    onPressed: () => _launchLink(_mailTo),
                  ),
                ],
              ),
            ),

            // Card 6: Link delega ritiro docx
            _buildCard(
              icon: FontAwesomeIcons.fileArrowDown,
              title: 'Delega ritiro alunno (File .docx)',
              content: 'Scarica il modulo di delega per il ritiro dell’alunno A.S. 2024/2025.',
              buttonLabel: 'Scarica .docx',
              buttonIcon: Icons.download,
              buttonAction: () => _launchLink(_docLink),
            ),
          ],
        ),
      ),
    );
  }

  /// Costruisce una Card generica con titolo, contenuto e (opzionale) un pulsante
  Widget _buildCard({
    required IconData icon,
    required String title,
    required String content,
    String? buttonLabel,
    IconData? buttonIcon,
    VoidCallback? buttonAction,
    Widget? extraButtons,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FaIcon(icon, size: 40, color: Colors.teal[700]),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 12),

            // Se c'è un pulsante, lo mostriamo
            if (buttonLabel != null && buttonAction != null)
              ElevatedButton.icon(
                icon: Icon(buttonIcon),
                label: Text(buttonLabel),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: buttonAction,
              ),

            // Se ci sono pulsanti extra (es. Chiamata, Email), li mostriamo
            if (extraButtons != null) ...[
              const SizedBox(height: 8),
              extraButtons,
            ]
          ],
        ),
      ),
    );
  }

  /// Card con la tabella delle tariffe
  Widget _buildTariffeCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FaIcon(FontAwesomeIcons.table, size: 40, color: Colors.teal[700]),
            const SizedBox(height: 12),
            const Text(
              'Tariffario Trasporto Scolastico 2024/2025',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Tabella con DataTable
            DataTable(
              columns: const [
                DataColumn(label: Text('Tipologia')),
                DataColumn(label: Text('Sett.')),
                DataColumn(label: Text('Ott-Mag')),
                DataColumn(label: Text('Giu')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('Infanzia')),
                  DataCell(Text('€10')),
                  DataCell(Text('€15')),
                  DataCell(Text('€15')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Primaria')),
                  DataCell(Text('€10')),
                  DataCell(Text('€15')),
                  DataCell(Text('€6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Secondaria I Grado')),
                  DataCell(Text('€14')),
                  DataCell(Text('€20')),
                  DataCell(Text('€7')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
