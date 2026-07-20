import 'dart:convert';
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
  int currentPage = 1;
  final int totalPages = 4;

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
      return (jsonDecode(response.body) as List<dynamic>)
          .map((pizza) => Pizza.fromJson(pizza))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0B2031),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'PIZZA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.61,
            ),
          ),
          leading: const Image(
            image: AppImages.menuIcon,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5293E),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Image(
                        image: AppImages.bag,
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/bag');
                      },
                    ),
                  ),
                  // Жёлтый бейдж с количеством
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFC107),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.62,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: pizzas.length,
                  itemBuilder: (context, index) {
                    final pizza = pizzas[index];
                    return makePizzaWidget(
                      photo: pizza.photo,
                      name: pizza.name,
                      priceL: pizza.priceL,
                      priceM: pizza.priceM,
                      reviewsCount: pizza.comments.length,
                    );
                  },
                ),
              ),
            ),
            // Пагинация
            Container(
              padding: const EdgeInsets.only(bottom: 20, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalPages, (index) {
                  final page = index + 1;
                  final isActive = page == currentPage;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFFE5293E)
                            : const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '$page',
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : const Color(0xFF999999),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ));
  }

  Widget makePizzaWidget({
    required String photo,
    required String name,
    required double priceL,
    required double priceM,
    required int reviewsCount,
  }) {
    const double rating = 4.5; // Захардкожен, можно добавить в модель

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.122),
              blurRadius: 20,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Фото пиццы
              Image.network(
                photo,
                width: 110,
                height: 110,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              // Название
              Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF0B2031),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              // Рейтинг звёздами
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index < rating.floor()
                          ? Icons.star
                          : (index < rating)
                              ? Icons.star_half
                              : Icons.star_border,
                      color: const Color(0xFFFFD700),
                      size: 14,
                    );
                  }),
                  const SizedBox(width: 6),
                  const Text(
                    '$rating',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0B2031),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              // Количество отзывов
              Text(
                '($reviewsCount Reviews)',
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF706E7B),
                ),
              ),
              const SizedBox(height: 12),
              // Размер L
              Row(
                children: [
                  const Text(
                    'Size L',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF706E7B),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${priceL.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF706E7B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // Размер M
              Row(
                children: [
                  const Text(
                    'Size M',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF706E7B),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${priceM.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF706E7B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/booking');
      },
    );
  }
}
