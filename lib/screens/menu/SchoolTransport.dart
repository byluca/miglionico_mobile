import 'package:flutter/material.dart';
import 'dart:convert';

class SchoolTransportScreen extends StatelessWidget {
  const SchoolTransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trasporto Scolastico'),
      ),
      body: const Center(
        child: Text(
          'Informazioni sul trasporto scolastico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}