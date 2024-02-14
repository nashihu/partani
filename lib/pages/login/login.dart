import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
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
                  Text('Back'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'SILAKAN MASUKKAN AKUN ANDA',
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Forgot your password?',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.blue,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.green,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: const Text(
                'Masuk sebagai Admin',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.green,
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: const Text(
                'Masuk sebagai Pengguna',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
