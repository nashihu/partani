import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicatorPage extends StatelessWidget {
  final String label;
  const IndicatorPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
              const SizedBox(height: 16),
              Image.asset('assets/delivery_man.png', width: Get.width * .7),
              const SizedBox(height: 75),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
