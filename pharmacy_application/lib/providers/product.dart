import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    this.description = dummyDescription,
    this.price,
    this.image,
    this.quantity = 1,
    this.isFavorite,
  });

  void _setFavoriteStatus(bool status) {
    this.isFavorite = status;
    notifyListeners();
  }

  void setQuantity(int quantity) {
    this.quantity = quantity;
    notifyListeners();
  }

  void toggleFavoriteStatus(){    
    this.isFavorite = !this
        .isFavorite; //update new status after user clicking the favorite icon   
    notifyListeners();

  }
}

const String dummyDescription =
    'Medicine is the science and practice of establishing the diagnosis, prognosis, treatment, and prevention of disease. Medicine encompasses a variety of health care practices evolved to maintain and restore health by the prevention and treatment of illness.';
