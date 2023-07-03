import 'package:delivery_app/custom_classes/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widthRatio = 30 / 375 * screenWidth;
    final screenHeight = MediaQuery.of(context).size.height;
    final heightRatio = 45 / 812 * screenHeight;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImages.homeBackground,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            GradientBackground(screenHeight: screenHeight),
            TitleWidget(heightRatio: heightRatio, widthRatio: widthRatio),
          ],
        ),
      ),
    );
  }
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.71 * screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.00, -1.00),
          end: const Alignment(0, 1),
          colors: [
            Colors.black.withOpacity(0.0001),
            Colors.black.withOpacity(0.0001),
            Colors.black.withOpacity(0.71)
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.heightRatio,
    required this.widthRatio,
  });

  final double heightRatio;
  final double widthRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: heightRatio, left: widthRatio),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restaurant',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: 40,
              letterSpacing: 1.366,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'cheeza pizza',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 27,
              letterSpacing: 0.63,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 170,
            height: 35,
            child: MaterialButton(
              color: const Color.fromRGBO(229, 41, 62, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.5),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              child: const Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'START ORDER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.327,
                    ),
                  ),
                  SizedBox(width: 19),
                  Image(
                    width: 5,
                    height: 10,
                    image: AppImages.chevronRight,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
