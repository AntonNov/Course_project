import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../dataclasses/category.dart';
import '../dataclasses/images.dart';

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
      return (jsonDecode(response.body) as List<dynamic>)
          .map((category) => Category.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget categoryWidget({
    required String image,
    required String category,
  }) {
    return GestureDetector(
      child: Stack(
        children: [
          Image.network(
            image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const GradientBackground(),
          Positioned(
            bottom: 21,
            right: 22,
            child: Text(
              category,
              style: const TextStyle(
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
        Navigator.pushNamed(context, '/pizzas');
      },
    );
  }

  List<Widget> categoriesWidget() {
    return categories
        .map(
          (category) =>
              categoryWidget(image: category.image, category: category.name),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 0,
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
            child: const Image(image: AppImages.bag),
            onPressed: () {
              Navigator.pushNamed(context, '/bag');
            },
          ),
        ],
      ),
      body: ListView(
        children: categoriesWidget(),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.00, -1.00),
          end: const Alignment(0, 1),
          colors: [
            Colors.black.withOpacity(0.0001),
            Colors.black.withOpacity(0.55)
          ],
        ),
      ),
    );
  }
}
