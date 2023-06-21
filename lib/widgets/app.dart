import 'package:delivery_app/widgets/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato-Regular',
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: const HomeScreen());
  }
}
