import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app/dataclasses/pizza.dart';
import 'package:flutter/material.dart';
import '../dataclasses/images.dart';

class PizzasScreen extends StatefulWidget {
  const PizzasScreen({super.key});

  @override
  PizzasScreenState createState() => PizzasScreenState();
}

class PizzasScreenState extends State<PizzasScreen> {
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
      final pizzas = (jsonDecode(response.body) as List<dynamic>)
          .map((pizza) => Pizza.fromJson(pizza))
          .toList();
      final box = await Hive.openBox<Pizza>('Pizzabox');
      if (box.isOpen) {
        for (final pizza in pizzas) {
          await box.add(pizza);
        }
        print(box.keys);
        print(box.values);
      }
      return pizzas;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Widget> pizzasWidget() {
    return pizzas
        .map(
          (pizza) => makePizzaWidget(
            photo: pizza.photo,
            name: pizza.name,
            priceL: pizza.priceL,
            priceM: pizza.priceM,
          ),
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
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: pizzasWidget(),
      ),
    );
  }

  Widget makePizzaWidget({
    required String photo,
    required String name,
    required double priceL,
    required double priceM,
  }) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const PizzaBackground(),
          SizedBox(
            width: 138,
            height: 255,
            child: Column(
              children: [
                Image.network(
                  photo,
                  width: 123,
                  height: 123,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(11, 32, 49, 1),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.253,
                  ),
                ),
                const SizedBox(height: 37),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Size L',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.64,
                          color: Color.fromRGBO(112, 110, 123, 1),
                        ),
                      ),
                    ),
                    Text(
                      '\$ $priceL',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.64,
                        color: Color.fromRGBO(112, 110, 123, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Size M',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.64,
                          color: Color.fromRGBO(112, 110, 123, 1),
                        ),
                      ),
                    ),
                    Text(
                      '\$ $priceM',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.64,
                        color: Color.fromRGBO(112, 110, 123, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/booking');
      },
    );
  }
}

class PizzaBackground extends StatelessWidget {
  const PizzaBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 255,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.122),
            blurRadius: 20,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
