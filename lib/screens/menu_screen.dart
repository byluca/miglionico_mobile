import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Opzione per "Contacts"
          ListTile(
            leading: const Icon(Icons.contacts, color: Colors.brown),
            title: const Text('Contatti'),
            onTap: () {
              Navigator.pushNamed(context, '/contacts');
            },
          ),
          const Divider(),

          // Opzione per "Locations"
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.brown),
            title: const Text('Luoghi'),
            onTap: () {
              Navigator.pushNamed(context, '/locations');
            },
          ),
          const Divider(),

          // Opzione per "Events"
          ListTile(
            leading: const Icon(Icons.event, color: Colors.brown),
            title: const Text('Eventi'),
            onTap: () {
              Navigator.pushNamed(context, '/events');
            },
          ),
          const Divider(),

          // Opzione per "About"
          ListTile(
            leading: const Icon(Icons.info, color: Colors.brown),
            title: const Text('Informazioni'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
