import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom_classes/category.dart';

Widget makeCategoryWidget({required String path, required String category}) {
  return Stack(children: [
    Image.network(
      path,
      height: 250,
      width: double.infinity,
      fit: BoxFit.cover,
    ),
    Positioned(
      bottom: 21,
      right: 22,
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Lato-BlackItalic',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          fontSize: 26,
          letterSpacing: 1.61,
        ),
      ),
    ),
  ]);
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        categories = value;
      });
    });
  }

  Future<List<Category>> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://raw.githubusercontent.com/alex-shinkevich/tms_api/main/project-10/categories.json'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as List<dynamic>;
      List<Category> categories = [];
      for (var category in jsonData) {
        categories.add(Category.fromJson(category));
      }
      return categories;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var category in categories) {
      children.add(
          makeCategoryWidget(path: category.image, category: category.name));
    }
    return Scaffold(
      body: ListView(
        children: children,
      ),
    );
  }
}
