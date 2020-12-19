import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;
  Cart({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    this.image,
  });
}