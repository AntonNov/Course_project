import 'package:delivery_app/custom_classes/images.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 290,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AppImages.bookingBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 270,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  Colors.black.withOpacity(0.82),
                  Colors.black.withOpacity(0.013),
                  Colors.black.withOpacity(0.0001)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
