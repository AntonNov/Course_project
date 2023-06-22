import 'dart:convert';
import 'package:delivery_app/widgets/bag_screen.dart';
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

  Widget makeCategoryWidget({required String path, required String category}) {
    return Stack(
      children: [
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
              fontFamily: 'Lato-BlackItalic',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: 26,
              letterSpacing: 1.61,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> makeCategoriesWidget() {
    List<Widget> children = [];
    for (var category in categories) {
      children.add(
        makeCategoryWidget(path: category.image, category: category.name),
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
            child: MaterialButton(
              minWidth: 40,
              height: 40,
              shape: const CircleBorder(),
              color: const Color.fromRGBO(229, 41, 62, 1),
              child: const Image(image: AppImages.fill),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BagScreen(),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 60,
            right: 16,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(225, 193, 7, 1),
              ),
              child: const Center(
                child: Text(
                  '1',
                  style: TextStyle(
                    fontFamily: 'Lato-Black',
                    fontWeight: FontWeight.w900,
                    fontSize: 6,
                    letterSpacing: 0.14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
