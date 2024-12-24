import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/contacts_screen.dart';
import 'screens/locations_screen.dart';
import 'screens/events_screen.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(const MiglionicoApp());
}

class MiglionicoApp extends StatelessWidget {
  const MiglionicoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miglionico App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        textTheme: Theme.of(context).textTheme.copyWith(
          headlineSmall: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/contacts': (context) => const ContactsScreen(),
        '/locations': (context) => const LocationsScreen(),
        '/events': (context) => const EventsScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
