import 'package:flutter/foundation.dart';
import 'package:pharmacy_application/models/cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;

  Order({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}