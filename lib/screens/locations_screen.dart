import 'package:flutter/material.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luoghi di Interesse'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLocationCard(
            title: 'Castello del Malconsiglio',
            description: 'Un castello storico con una vista mozzafiato.',
            imageUrl: 'https://via.placeholder.com/150',
          ),
          const SizedBox(height: 16),
          _buildLocationCard(
            title: 'Chiesa Madre',
            description: 'Un luogo di culto iconico della città.',
            imageUrl: 'https://via.placeholder.com/150',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(
      {required String title, required String description, required String imageUrl}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
            child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
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
        ],
      ),
    );
  }
}
