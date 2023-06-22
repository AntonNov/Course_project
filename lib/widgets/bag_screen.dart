import 'package:delivery_app/custom_classes/images.dart';
import 'package:flutter/material.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            width: double.infinity,
            image: AppImages.bagBackground,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 15,
            top: 60,
            child: Row(
              children: [
                MaterialButton(
                  minWidth: 40,
                  height: 40,
                  shape: const CircleBorder(),
                  color: const Color.fromRGBO(229, 41, 62, 1),
                  child:
                      const Center(child: Image(image: AppImages.chevronLeft)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 71),
                const Image(image: AppImages.fill),
                const SizedBox(width: 12),
                const Text(
                  'Your Bag',
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    letterSpacing: 1.36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
