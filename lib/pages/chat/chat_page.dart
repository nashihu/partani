import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
            Row(
              children: [
                const Icon(Icons.chevron_left),
                const SizedBox(width: 8),
                Image.asset('assets/logo.png', width: 50),
                const SizedBox(width: 10),
                const Text('Partani', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_drop_down),
                const Expanded(child: SizedBox()),
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 8),
                const Icon(Icons.menu),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (c, i) => Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.network(
                            'https://www.allprodad.com/wp-content/uploads/2021/03/05-12-21-happy-people.jpg',
                            width: Get.width * .1,
                            height: Get.width * .1,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ivar Jenner',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('15.00'),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Gue pengen bayar produk yang ingin beli tadi, tapi ga bisa scan barcode mohon bantuannya dong......',
                                    maxLines: 3,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '15.00',
                                  style: TextStyle(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
