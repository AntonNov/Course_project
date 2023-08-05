import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dataclasses/pizza.dart';
import 'widgets/app.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PizzaAdapter());
  runApp(const App());
}
