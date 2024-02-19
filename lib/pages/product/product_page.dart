import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/model/product_model.dart';
import 'package:petani/pages/cart/cart_page.dart';

class ProductController extends GetxController {
  final selected = 1.obs;

  void add() {
    selected.value++;
  }

  void remove() {
    if (selected.value == 0) return;
    selected.value--;
  }

  void addToCart() {
    if (selected.value < 1) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Qty harus lebih dari 0',
        duration: Duration(seconds: 2),
      ));
      return;
    }
    Get.find<CartController>().addFromProduct(product, selected.value);
    Get.back();
    Get.showSnackbar(const GetSnackBar(
      message: 'Berhasil Tambah Keranjang',
      duration: Duration(seconds: 2),
    ));
  }

  final ProductModel product;
  ProductController(this.product);
}

class ProductPage extends StatelessWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProductController(product));
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: Get.back,
                child: const Icon(Icons.chevron_left, size: 30),
              ),
            ],
          ),
          Image.network(
            product.imageUrl ?? '',
            width: Get.width * .4,
            height: Get.width * .4,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        '${product.rate}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${product.price} /${product.unit}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name ?? '',
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: ctrl.remove,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${ctrl.selected.value}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ctrl.add,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.desc ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Add Ons',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                for (int i = 0; i < 10; i++) ...[
                  addOn(
                    imageUrl:
                        'https://daganghalal.blob.core.windows.net/28741/Product/1000x1000__berasfaiza1-1656917267252.jpg',
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: ctrl.addToCart,
            child: Container(
              width: Get.width * .5,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addOn({required String imageUrl}) {
    return Image.network(imageUrl);
  }
}
