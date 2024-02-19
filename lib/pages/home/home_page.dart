import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/model/product_model.dart';
import 'package:petani/pages/product/product_page.dart';

class HomeController extends GetxController {
  final search = TextEditingController();
  final products = RxList<ProductModel>(
    model.map((e) => ProductModel.fromJson(e)).toList(),
  );
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  HomeController get c => controller;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
                margin: const EdgeInsets.only(bottom: 75),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Halo !! Selamat datang di aplikasi Partani'),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                      ),
                      height: 58,
                      child: TextFormField(
                        controller: c.search,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          // hintStyle: TextStyle(fontSize: 12),
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  menuItem(label: 'All', color: Colors.purple),
                  menuItem(label: 'Sayur', color: Colors.grey),
                  menuItem(label: 'Buah', color: Colors.grey),
                  menuItem(label: 'Rempah-Rempah', color: Colors.grey),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: [...c.products.map((e) => itemProduct(e))],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemProduct(ProductModel product) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductPage(product: product));
      },
      child: SizedBox(
        width: 130,
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 10),
                    const SizedBox(width: 8),
                    Text(
                      '${product.rate}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Image.network(
                  product.imageUrl ?? '',
                  width: 130 - 32,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_pin, size: 10),
                              const SizedBox(width: 4),
                              Text(product.city ?? '',
                                  style: const TextStyle(fontSize: 10)),
                            ],
                          ),
                          Text(
                            product.name ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${product.price} /${product.unit}',
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 10)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem({required String label, required Color color}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: color,
            ),
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 16),
          Text(label),
        ],
      ),
    );
  }
}
