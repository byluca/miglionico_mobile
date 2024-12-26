import 'package:flutter/material.dart';
import 'dart:convert';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prenotazioni Servizi'),
      ),
      body: const Center(
        child: Text(
          'Prenota servizi pubblici comodamente.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}