import 'package:flutter/foundation.dart';
import 'package:pharmacy_application/providers/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: '1',
      title: 'Betadine Antiseptic Sol',
      price: 10.4,
      image: 'assets/images/medicine-1.png',
    ),
    Product(
      id: '2',
      title: 'Farzincol 10mg',
      price: 5.3,
      image: 'assets/images/medicine-2.png',
    ),
    Product(
      id: '3',
      title: 'Kin_Gingivon',
      price: 2.1,
      image: 'assets/images/medicine-3.png',
    ),
    Product(
      id: '4',
      title: 'Magne B6 Corbiere',
      price: 12.4,
      image: 'assets/images/medicine-4.png',
    ),
    Product(
      id: '5',
      title: 'Paracetamol_Choay',
      price: 9.8,
      image: 'assets/images/medicine-5.png',
    ),
  ];
  List<Product> get favoriteItems {
    return _products.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
