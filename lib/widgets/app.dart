import 'package:delivery_app/widgets/bag_screen.dart';
import 'package:delivery_app/widgets/home_screen.dart';
import 'package:delivery_app/widgets/menu_screen.dart';
import 'package:delivery_app/widgets/pizza_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato-Regular',
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
        '/bag': (context) => const BagScreen(),
        '/pizza': (context) => const PizzaScreen(),
      },
      initialRoute: '/',
    );
  }
}
