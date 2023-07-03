import 'dart:convert';
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

  Widget makeCategoryWidget({required String image, required String category}) {
    return GestureDetector(
      child: Stack(
        children: [
          Image.network(
            image,
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
                fontFamily: 'Lato-BlackItalic',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                fontSize: 26,
                letterSpacing: 1.61,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/pizza');
      },
    );
  }

  List<Widget> makeCategoriesWidget() {
    List<Widget> children = [];
    for (final category in categories) {
      children.add(
        makeCategoryWidget(image: category.image, category: category.name),
      );
    }
    return children;
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Image(
          image: AppImages.menuIcon,
        ),
        actions: [
          MaterialButton(
            minWidth: 40,
            height: 40,
            shape: const CircleBorder(),
            color: const Color.fromRGBO(229, 41, 62, 1),
            child: const Image(image: AppImages.fill),
            onPressed: () {
              Navigator.pushNamed(context, '/bag');
            },
          ),
        ],
      ),
      body: ListView(
        children: makeCategoriesWidget(),
      ),
    );
  }
}
