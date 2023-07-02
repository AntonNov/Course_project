import 'package:delivery_app/custom_classes/images.dart';

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
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImages.homeBackground,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: heightRatio, left: widthRatio),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Restaurant',
                style: TextStyle(
                  fontFamily: 'Lato-BlackItalic',
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
                      SizedBox(width: 18),
                      Text(
                        'START ORDER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 0.327,
                        ),
                      ),
                      SizedBox(width: 17),
                      Image(
                        image: AppImages.chevronRight,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
