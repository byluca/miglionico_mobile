import 'package:flutter/material.dart';
import 'dart:convert';


class SchoolCanteenScreen extends StatelessWidget {
  const SchoolCanteenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensa Scolastica'),
      ),
      body: const Center(
        child: Text(
          'Dettagli sul servizio di mensa scolastica.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}