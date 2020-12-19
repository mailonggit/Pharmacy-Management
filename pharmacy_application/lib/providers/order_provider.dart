import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_application/models/cart.dart';
import 'package:pharmacy_application/models/order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  final String userId;
  final String token;
  List<Order> get orders {
    return [..._orders];
  }

  
  OrderProvider(this.token, this._orders, this.userId);
  Future<void> fetchAndSetOrders() async {
    final url =
        'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/orders/$userId.json?auth=$token';
    final response = await http.get(url);

    final List<Order> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        Order(
          id: orderId,
          amount: orderData['amount'],
          products: (orderData['products'] as List<dynamic>)
              .map((item) => Cart(
                    id: item['id'],
                    price: item['price'],
                    quantity: item['quantity'],
                    title: item['title'],
                  ))
              .toList(),
          dateTime: DateTime.parse(orderData['dateTime']),
        ),
      );
    });

    _orders = loadedOrders;
    print('fetch order successfully');
    notifyListeners();
  }

  Future<void> addOrder(List<Cart> cartProducts, double total) async {
    final url =
        'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/orders/$userId.json?auth=$token';
    final timeStamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProducts
              .map((product) => {
                    'id': product.id,
                    'title': product.title,
                    'price': product.price,
                    'quantity': product.quantity,
                  })
              .toList(),
        }));
    _orders.insert(
      0,
      Order(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
