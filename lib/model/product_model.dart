class ProductModel {
  String? id, name, desc, imageUrl, city, unit;
  int? price;
  double? rate;

  ProductModel();

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel()
      ..id = json['id']
      ..name = json['name']
      ..desc = json['desc']
      ..imageUrl = json['imageUrl']
      ..city = json['city']
      ..rate = json['rate']
      ..price = json['price']
      ..unit = json['unit'];
  }
}

List<Map<String, dynamic>> get model => [
      {
        "id": "1",
        "name": 'Bunga Kol',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
      {
        "id": '2',
        "name": 'Bunga Kal',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
      {
        "id": '3',
        "name": 'Bunga Kil',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
      {
        "id": '4',
        "name": 'Bunga Kel',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
      {
        "id": '5',
        "name": 'Bunga Kul',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
      {
        "id": "6",
        "name": 'Bunga Kol',
        'desc':
            'Bunga Kol mengandung vitamin C yang dikenal sebagai antioksidan untuk meningkatkan daya tahan tubuh.',
        'imageUrl':
            'https://cf.shopee.co.id/file/75ae275096139f7a18401b0603a0af75',
        'city': 'Posea',
        'rate': 4.9,
        'price': 5000,
        'unit': 'kg'
      },
    ];
