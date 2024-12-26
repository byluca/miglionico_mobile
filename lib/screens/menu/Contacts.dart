import 'package:flutter/material.dart';
import 'dart:convert';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatti e Info'),
      ),
      body: const Center(
        child: Text(
          'Dettagli di contatto e informazioni utili.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}