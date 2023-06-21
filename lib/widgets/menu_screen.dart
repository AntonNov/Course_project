import 'dart:convert';
import 'package:delivery_app/widgets/pizza._screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom_classes/category.dart';
import '../custom_classes/images.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
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

  List<Widget> makeCategoriesWidget() {
    List<Widget> children = [];
    for (var category in categories) {
      children.add(
          makeCategoryWidget(path: category.image, category: category.name));
    }
    return children;
  }

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
      final jsonData = jsonDecode(response.body) as List<dynamic>;
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
      Widget temp =
          makeCategoryWidget(path: category.image, category: category.name);
      children.add(temp);
    }
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: makeCategoriesWidget(),
          ),
          const Positioned(
            top: 61,
            left: 15,
            child: Image(
              image: AppImages.menuIcon,
            ),
          ),
          Positioned(
            top: 61,
            right: 15,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(229, 41, 62, 1),
              ),
              child: const Image(image: AppImages.fill),
            ),
          ),
        ],
      ),
    );
  }
}
