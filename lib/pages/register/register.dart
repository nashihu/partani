import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/pages/login/login.dart';

class RegisterController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  RegisterController get c => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * .1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/logo.png", width: Get.width * .5)],
            ),
            const SizedBox(height: 32),
            const Text(
              'Daftarkan Akun Anda',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: c.username,
              decoration: const InputDecoration(
                  hintText: 'Masukkan Username', label: Text('Username')),
            ),
            // const SizedBox(height: 16),
            TextFormField(
              controller: c.email,
              decoration: const InputDecoration(
                hintText: 'Masukkan Email',
                label: Text('Email'),
              ),
            ),
            // const SizedBox(height: 16),
            TextFormField(
              controller: c.username,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Masukkan Password',
                label: Text('Password'),
                suffix: Icon(Icons.remove_red_eye),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: Get.width,
              child: ElevatedButtonTheme(
                data: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      return Colors.green;
                    }),
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return size 40, otherwise 20
                      if (states.contains(MaterialState.pressed)) {
                        return const TextStyle(
                            fontSize: 40, color: Colors.white);
                      }
                      return const TextStyle(fontSize: 20, color: Colors.white);
                    }),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => Get.off(() => const LoginPage()),
              child: const Row(
                children: [
                  Text('Sudah memiliki akun? '),
                  Text('Masuk', style: TextStyle(color: Colors.blue))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
