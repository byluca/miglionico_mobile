import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storia di Miglionico'),
        backgroundColor: Colors.brown[900],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Un po\' di storia...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
