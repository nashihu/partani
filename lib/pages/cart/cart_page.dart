import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/model/cart_model.dart';
import 'package:petani/model/product_model.dart';
import 'package:petani/pages/delivery/delivery_page.dart';

class CartController extends GetxController {
  final carts = RxList<CartModel>();

  @override
  void onInit() {
    super.onInit();
    carts.value = [
      CartModel()
        ..product = (ProductModel()
          ..name = 'Bunga Kol'
          ..imageUrl =
              'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75')
        ..qty = 3,
      CartModel()
        ..product = (ProductModel()
          ..name = 'Cabe'
          ..imageUrl =
              'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75')
        ..qty = 2,
      CartModel()
        ..product = (ProductModel()
          ..name = 'Kurupuk'
          ..imageUrl =
              'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75')
        ..qty = 10
    ];
  }

  add() {}
  remove() {}
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  CartController get ctrl => Get.find();
  CartModel get ok => ctrl.carts[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Keranjang',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Pilih alamat pengiriman',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.chevron_right),
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () => Get.to(() => const DeliveryPage()),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Pilih Pengiriman',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(height: 32),
            for (int i = 0; i < 10; i++) ...[
              itemCart(ok),
            ],
            const SizedBox(height: 32),
            InkWell(
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lihat semua metode',
                        style: TextStyle(
                          color: Color(0xFF4058D9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFEFEEEE),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        'assets/transfer.png',
                        width: 150,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manual Transfer',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Transfer langsung',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6F6D6D),
                          ),
                        )
                      ],
                    ),
                  ),
                  // const Icon(Icons.chevron_right)
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Biaya Pengiriman',
                  style: TextStyle(
                    color: Color(0xFF6F6D6D),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Rp.15.000',
                  style: TextStyle(
                    color: Color(0xFF868585),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal (3 items)',
                  style: TextStyle(
                    color: Color(0xFF6F6D6D),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Rp.15.000',
                  style: TextStyle(
                    color: Color(0xFFC9AA05),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Rp.15.000',
                  style: TextStyle(
                    color: Color(0xFFC9AA05),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(26)),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: Get.width * .7,
              alignment: Alignment.center,
              child: const Text(
                'Pesan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCart(CartModel dummy) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            dummy.product?.imageUrl ?? '',
            width: Get.width * .1,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dummy.product?.name ?? '',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const Text(
                'Rp.36.000',
                style: TextStyle(
                  color: Color(0xFFC9AA05),
                  fontSize: 12,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${dummy.qty}',
                      style: const TextStyle(
                        fontSize: 13,
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
          InkWell(
            onTap: () {},
            child: const Icon(Icons.clear, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
