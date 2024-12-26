import 'package:flutter/material.dart';
import 'dart:convert';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valuta Miglionico'),
      ),
      body: const Center(
        child: Text(
          'Lascia il tuo feedback per Miglionico.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}