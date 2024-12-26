import 'package:flutter/material.dart';
import 'dart:convert';

class RecyclingScreen extends StatelessWidget {
  const RecyclingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raccolta Differenziata'),
      ),
      body: const Center(
        child: Text(
          'Guida alla raccolta differenziata a Miglionico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}