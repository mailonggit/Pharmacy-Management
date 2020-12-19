import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  int quantity;
  bool isFavorite = false;
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.quantity = 1,
    this.isFavorite,
  });

}

