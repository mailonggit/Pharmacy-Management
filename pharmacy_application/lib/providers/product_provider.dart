import 'package:flutter/foundation.dart';
import 'package:pharmacy_application/providers/http_exception.dart';
import 'package:pharmacy_application/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String dummyDescription =
    'Medicine is the science and practice of establishing the diagnosis, prognosis, treatment, and prevention of disease. Medicine encompasses a variety of health care practices evolved to maintain and restore health by the prevention and treatment of illness.';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    // Product(
    //   id: '1',
    //   title: 'Betadine Antiseptic Sol',
    //   price: 10.4,
    //   image:
    //       'https://lewishoanglong.com/wp-content/uploads/2020/12/medicine-1.png',
    // ),
    // Product(
    //   id: '2',
    //   title: 'Farzincol 10mg',
    //   price: 5.3,
    //   image:
    //       'https://lewishoanglong.com/wp-content/uploads/2020/12/medicine-2.png',
    // ),
    // Product(
    //   id: '3',
    //   title: 'Kin_Gingivon',
    //   price: 2.1,
    //   image:
    //       'https://lewishoanglong.com/wp-content/uploads/2020/12/medicine-3.png',
    // ),
    // Product(
    //   id: '4',
    //   title: 'Magne B6 Corbiere',
    //   price: 12.4,
    //   image:
    //       'https://lewishoanglong.com/wp-content/uploads/2020/12/medicine-4.png',
    // ),
    // Product(
    //   id: '5',
    //   title: 'Paracetamol_Choay',
    //   price: 9.8,
    //   image:
    //       'https://lewishoanglong.com/wp-content/uploads/2020/12/medicine-5.png',
    // ),
  ];

  final String token;
  ProductProvider(this.token, this._products);
  List<Product> get favoriteItems {
    return _products.where((prodItem) => prodItem.isFavorite).toList();
  }

  List<Product> get products {
    return [..._products];
  }

  Product findById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    var url =
        'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/products.json?auth=$token';
    print(url);
    try {
      print('loaded');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          image: prodData['image'],
        ));
      });
      _products = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  //don't need to return future because async will return future automatically
  Future<void> addProduct(Product product) async {
    final url =
        'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/products.json?auth=$token';    
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'image': product.image,
            'price': product.price,            
          },
        ),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        image: product.image,
        id: json.decode(response.body)['name'],
      );
      _products.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _products.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/products/$id.json?auth=$token';
      await http.patch(
        url,
        body: json.encode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'image': newProduct.image,
            'price': newProduct.price,
          },
        ),
      );
      _products[prodIndex] = newProduct;
      print('update successfully');
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/products/$id.json?auth=$token';    
    final existingProductIndex = _products.indexWhere((prod) => prod.id == id); 
    var existingProduct = _products[existingProductIndex];
    _products.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _products.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException(message: 'Could not delete the product');
    }
    existingProduct = null; //set null after deleteing product
    print('delete successfully');
  }
}
