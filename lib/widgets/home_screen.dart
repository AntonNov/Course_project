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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Restaurant',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lato-Bold',
                  fontSize: 40,
                  fontStyle: FontStyle.italic),
            ),
            const Text(
              'cheeza pizza',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 27,
              ),
            ),
            const SizedBox(width: 18, height: 18),
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
                  Expanded(
                    child: Text(
                      'START ORDER',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato-Regular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color.fromRGBO(242, 242, 242, 1),
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
