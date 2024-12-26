import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Sostituisci con la tua API Key di OpenWeatherMap
  final String _apiKey = '4e74c8b46bce5bd1f8fea578dbb8377f';
  // Nome città (puoi cambiarla o renderla dinamica)
  final String _cityName = 'Miglionico';

  // Dati che vogliamo mostrare
  String? _temperature;
  String? _description;
  String? _iconCode;
  String? _humidity;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  // Funzione per recuperare i dati meteo
  Future<void> _fetchWeatherData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Costruiamo la URL per la chiamata API:
      // Es: https://api.openweathermap.org/data/2.5/weather?q=Miglionico&appid=LA_TUA_API_KEY&units=metric
      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$_apiKey&units=metric&lang=it',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          // Estraiamo i campi che ci interessano
          _temperature = data['main']['temp'].toString();
          _description = data['weather'][0]['description'];
          _iconCode = data['weather'][0]['icon']; // es. "04d"
          _humidity = data['main']['humidity'].toString();
          _isLoading = false;
        });
      } else {
        // Gestisci errore di risposta
        setState(() {
          _errorMessage =
          'Errore durante il recupero dei dati (Status code: ${response.statusCode})';
          _isLoading = false;
        });
      }
    } catch (e) {
      // Gestisci eccezione (es. problemi di rete)
      setState(() {
        _errorMessage = 'Impossibile recuperare i dati meteo: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meteo - $_cityName'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _errorMessage != null
            ? Text(
          _errorMessage!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        )
            : _buildWeatherInfo(),
      ),
    );
  }

  // Widget personalizzato che mostra i dati meteo in modo carino
  Widget _buildWeatherInfo() {
    // Ricordati che alcuni valori potrebbero essere null all’avvio,
    // quindi controlliamo prima di costruire la UI definitiva.
    if (_temperature == null || _description == null || _iconCode == null) {
      return const Text('Dati meteo non disponibili');
    }

    final iconUrl = 'http://openweathermap.org/img/wn/$_iconCode@2x.png';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$_cityName',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Icona rappresentante le condizioni meteo
            Image.network(iconUrl),
            Text(
              '${_temperature!}°C',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _description!.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Umidità: $_humidity%',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Pulsante per ricaricare i dati
            ElevatedButton(
              onPressed: _fetchWeatherData,
              child: const Text('Aggiorna'),
            ),
          ],
        ),
      ),
    );
  }
}
