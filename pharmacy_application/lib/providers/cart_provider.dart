import 'package:flutter/foundation.dart';
import 'package:pharmacy_application/models/cart.dart';



class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

//calculate total amount of selected product
  double get totalAmount {
    var total = 0.0;

    _items.forEach((item, cartIttem) {
      print('quantity: ' + cartIttem.quantity.toString());
      total += cartIttem.price * cartIttem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String image,
      int newQuantity) {
    if (_items.containsKey(productId)) {
      print('update product');
      _items.update(
          productId,
          (existingItem) => Cart(
                id: existingItem.id,
                title: existingItem.title,
                quantity: newQuantity + 1,
                price: existingItem.price,
                image: existingItem.image,
              ));
    } else {
      print('add new product');
      _items.putIfAbsent(
        productId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: newQuantity,
          image: image,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

//clear item
  void clear() {
    _items = {};
    notifyListeners();
  }
}
