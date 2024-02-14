import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/pages/login/login.dart';
import 'package:petani/pages/register/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: Get.width * .5),
            const SizedBox(height: 32),
            const Text('Selamat Datang'),
            const SizedBox(height: 8),
            const Text('Petani'),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(
                  label: 'Register',
                  onTap: () => Get.to(() => const RegisterPage()),
                ),
                const SizedBox(width: 16),
                button(
                  label: 'Log in',
                  onTap: () => Get.to(() => const LoginPage()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({required String label, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: Colors.green,
        ),
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
