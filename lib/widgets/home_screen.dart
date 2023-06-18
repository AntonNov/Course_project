import 'package:delivery_app/widgets/menu_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthRatio = 30 / 375 * screenWidth;
    final screenHeight = MediaQuery.of(context).size.height;
    final heightRatio = 50 / 812 * screenHeight;
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
              bottom: heightRatio,
              left: widthRatio,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurant',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato-BlackItalic',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      letterSpacing: 1.37,
                    ),
                  ),
                  const SizedBox(width: 206, height: 2),
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
                  const SizedBox(width: 206, height: 16),
                  MaterialButton(
                    color: const Color.fromRGBO(229, 41, 62, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuWidget()),
                      );
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 35, height: 35),
                        Text(
                          'START ORDER',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.33,
                          ),
                        ),
                        SizedBox(width: 14.5, height: 35),
                        Icon(
                          Icons.chevron_right,
                          color: Color.fromRGBO(242, 242, 242, 1),
                        ),
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
