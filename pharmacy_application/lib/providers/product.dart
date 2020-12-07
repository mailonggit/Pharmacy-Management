import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  bool isFavorite;
  Product({
    @required this.id,
    @required this.title,
    this.description = dummyDescription,
    @required this.price,
    @required this.image,
    this.isFavorite = false,
  });

  void _setFavoriteStatus(bool status) {
    this.isFavorite = status;
    notifyListeners();
  }
}

const String dummyDescription =
    'Medicine is the science and practice of establishing the diagnosis, prognosis, treatment, and prevention of disease. Medicine encompasses a variety of health care practices evolved to maintain and restore health by the prevention and treatment of illness.';
