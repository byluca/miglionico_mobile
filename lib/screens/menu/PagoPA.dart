import 'package:flutter/material.dart';
import 'dart:convert';

class PagoPAScreen extends StatelessWidget {
  const PagoPAScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PagoPA'),
      ),
      body: const Center(
        child: Text(
          'Collegamento al servizio PagoPA.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}