import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventi'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            title: 'Festa Medievale',
            date: '12 Dicembre 2024',
            description: 'Un tuffo nel passato con costumi e spettacoli.',
          ),
          const SizedBox(height: 16),
          _buildEventCard(
            title: 'Sagra del Pane',
            date: '18 Gennaio 2025',
            description: 'Degustazione di pane tradizionale.',
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
