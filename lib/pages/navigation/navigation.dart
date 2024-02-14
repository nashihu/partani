import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/pages/chat/chat_page.dart';
import 'package:petani/pages/home/home_page.dart';
import 'package:petani/pages/profil/profile_page.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  onChangeNav(int i) {
    selectedIndex.value = i;
  }
}

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  NavigationController get c => controller;

  Widget get body {
    switch (c.selectedIndex.value) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatPage();
      case 3:
        return const ProfilePage();
    }
    return const Text('undefined');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.selectedIndex.value,
          onTap: c.onChangeNav,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      );
    });
  }
}
