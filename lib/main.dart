import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(const MiglionicoApp());
}

class MiglionicoApp extends StatelessWidget {
  const MiglionicoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miglionico Mobile',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      // Definiamo le route in modo da poter navigare tra WelcomeScreen e MenuScreen
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}
