import 'package:delivery_app/widgets/bag_screen.dart';
import 'package:delivery_app/widgets/home_screen.dart';
import 'package:delivery_app/widgets/menu_screen.dart';
import 'package:delivery_app/widgets/pizzas_screen.dart';
import 'package:flutter/material.dart';
import 'booking_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato-Regular',
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/bag': (context) => const BagScreen(),
        '/pizzas': (context) => const PizzasScreen(),
        '/booking': (context) => const BookingScreen()
      },
    );
  }
}
