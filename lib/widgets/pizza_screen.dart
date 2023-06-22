import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delivery_app/custom_classes/pizza.dart';
import 'package:flutter/material.dart';
import '../custom_classes/images.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  PizzaScreenState createState() => PizzaScreenState();
}

class PizzaScreenState extends State<PizzaScreen> {
  List<Pizza> pizzas = [];
  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        pizzas = value;
      });
    });
  }

  Future<List<Pizza>> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://raw.githubusercontent.com/alex-shinkevich/tms_api/main/project-10/pizzas.json'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      List<Pizza> pizzas = [];
      for (var pizza in jsonData) {
        pizzas.add(Pizza.fromJson(pizza));
      }
      return pizzas;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget makePizzaWidget(
      {required String photo,
      required String name,
      required double priceL,
      required double priceM}) {
    const blackColor = Color.fromRGBO(11, 32, 49, 1);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.13),
                blurRadius: 20,
              ),
            ],
          ),
          child: const Image(
            image: AppImages.pizzaBackground,
            height: 170,
            width: 255,
            // fit: BoxFit.fill,
          ),
        ),
        Image.network(
          photo,
        ),
        Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                color: blackColor,
              ),
            ),
            Text(
              priceL.toString(),
              style: const TextStyle(
                color: blackColor,
              ),
            ),
            Text(
              priceM.toString(),
              style: const TextStyle(
                color: blackColor,
              ),
            )
          ],
        ),
      ],
    );
  }

  List<Widget> makePizzasWidget() {
    List<Widget> children = [];
    for (var pizza in pizzas) {
      children.add(
        makePizzaWidget(
            photo: pizza.photo,
            name: pizza.name,
            priceL: pizza.priceL,
            priceM: pizza.priceM),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImages.bagBackground,
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
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
                  Navigator.pushNamed(context, '/bag');
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
            const Positioned(
              top: 63,
              left: 160,
              child: Text(
                'PIZZA',
                style: TextStyle(
                  fontFamily: 'Lato-Bold',
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  letterSpacing: 1.61,
                ),
              ),
            ),
            Positioned(
              // top: 50,
              child: ListView(
                children: makePizzasWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
