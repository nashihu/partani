import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF64AA54),
      body: Column(
        children: [
          SizedBox(height: Get.statusBarHeight / Get.pixelRatio),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.chevron_left),
              SizedBox(width: 16),
              Text(
                'Tambah Alamat Pengiriman',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          form(label: 'Nama Penerima'),
          form(label: 'Nomor Telepon'),
          form(label: 'Provinsi / Kota / Kecamatan / Kelurahan'),
          form(label: 'Jalan / Nama Bangunan'),
          form(label: 'Unit / Lantai / RT / RW'),
          const SizedBox(height: 16),
          Image.asset('assets/forest.png', width: Get.width * .5),
          const SizedBox(height: 16),
          InkWell(
            onTap: Get.back,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF439A31),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              width: Get.width * .5,
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: const Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: label,
              contentPadding: const EdgeInsets.only(left: 16),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
