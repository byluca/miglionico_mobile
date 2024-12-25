import 'package:flutter/material.dart';

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
