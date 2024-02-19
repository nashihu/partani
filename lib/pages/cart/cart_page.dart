import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petani/model/cart_model.dart';
import 'package:petani/model/product_model.dart';
import 'package:petani/pages/address/address_page.dart';
import 'package:petani/pages/delivery/delivery_page.dart';

class CartController extends GetxController {
  final carts = RxList<CartModel>();
  final i = 1.obs;

  void addFromProduct(ProductModel productModel, int qty) {
    List<String> ids = [];
    ids = carts.map((e) => e.product?.id).whereType<String>().toList();
    final id = productModel.id;
    if (id == null) return;
    final idx = ids.indexOf(id);
    if (idx > -1) {
      carts[idx].qty += qty;
    } else {
      carts.add(CartModel()
        ..product = productModel
        ..qty = qty);
    }
  }

  add(int i) {
    carts[i].qty++;
    this.i.value = 2;
    carts.refresh();
  }

  remove(int i) {
    if (carts[i].qty == 1) return;
    carts[i].qty--;
    this.i.value = 2;
    carts.refresh();
  }

  delete(int i) {
    carts.removeAt(i);
    carts.refresh();
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  CartController get ctrl => Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _build(context));
  }

  Widget _build(BuildContext context) {
    if (ctrl.carts.isEmpty) {
      return const Center(child: Text('Belum ada barang di keranjang'));
    }
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
            InkWell(
              onTap: () {
                Get.to(() => const AddressPage());
              },
              child: const Row(
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
            for (int i = 0; i < ctrl.carts.length; i++) ...[itemCart(i)],
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

  Widget itemCart(int i) {
    final dummy = ctrl.carts[i];
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
                    onTap: () => ctrl.remove(i),
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
                    onTap: () => ctrl.add(i),
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
            onTap: () => ctrl.delete(i),
            child: const Icon(Icons.clear, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
