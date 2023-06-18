import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 50,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato-Bold',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      letterSpacing: 1.37,
                    ),
                  ),
                  const SizedBox(width: 134, height: 2),
                  const Text(
                    'cheeza pizza',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 27,
                      letterSpacing: 0.63,
                    ),
                  ),
                  const SizedBox(width: 134, height: 16),
                  Container(
                    width: 170,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(229, 41, 62, 1),
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 35, height: 35),
                        Text(
                          'START ORDER',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.33,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
                        SizedBox(width: 15, height: 35),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
