import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                // margin: const EdgeInsets.only(bottom: 75),
                height: Get.width * .5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/a-/ALV-UjVEaDUEUo9JlvcGe99OYtlhjJH0ZUKXirRWVnTV0lLEL18=s360-x',
                        height: Get.width * .25,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: Get.width * .25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Ruth Karolina Sirait',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF66BBB1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              padding: const EdgeInsets.all(12),
                              child: const Text('Atur Akun'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                bottom: 32,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EMAIL: ruthsirait25@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      'No. Telepon: 6281264086157',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
