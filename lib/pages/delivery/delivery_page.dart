import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
            InkWell(
              onTap: Get.back,
              child: const Row(
                children: [
                  Icon(Icons.chevron_left),
                  SizedBox(width: 16),
                  Text(
                    'Pilih Pengiriman',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Get.width * .2),
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              width: Get.width,
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Prioritas Utama',
                    style: TextStyle(color: Color(0xFF6F7174)),
                  ),
                  Text(
                    'Rp.15.000',
                    style: TextStyle(color: Color(0xFF101010)),
                  ),
                ],
              ),
            ),
            Image.asset('assets/mail_full.png'),
            InkWell(
              onTap: Get.back,
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.green,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
