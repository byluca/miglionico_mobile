import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animazione del testo di benvenuto
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Ciao!',
                  textStyle: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
                TypewriterAnimatedText(
                  'Benvenuto a Miglionico',
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.brown,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(seconds: 1),
              displayFullTextOnTap: true,
            ),
            const SizedBox(height: 40),
            // Pulsante per accedere al menu
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, // Colore di sfondo
                foregroundColor: Colors.white, // Colore del testo
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Vai al menu'),
            ),
          ],
        ),
      ),
    );
  }
}
