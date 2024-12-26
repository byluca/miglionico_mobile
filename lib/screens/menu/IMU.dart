import 'package:flutter/material.dart';
import 'dart:convert';

/// SCHERMATE NUOVE
class IMUScreen extends StatelessWidget {
  const IMUScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMU IUC TASI'),
      ),
      body: const Center(
        child: Text(
          'Informazioni su IMU, IUC e TASI.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}