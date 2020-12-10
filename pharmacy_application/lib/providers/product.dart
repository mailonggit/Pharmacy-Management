import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  int quantity;
  bool isFavorite;
  Product({
    this.id,
    this.title,
    this.description = dummyDescription,
    this.price,
    this.image,
    this.quantity = 1,
    this.isFavorite = false,
  });

  void _setFavoriteStatus(bool status) {
    this.isFavorite = status;
    notifyListeners();
  }

  void setQuantity(int quantity) {
    this.quantity = quantity;
    notifyListeners();
  }

  void toggleFavoriteStatus() {
    //final oldStatus = this.isFavorite; //store previous favorite status
    this.isFavorite = !this
        .isFavorite; //update new status after user clicking the favorite icon
    //_setFavoriteStatus(!this.isFavorite);
    notifyListeners();
  }
}

const String dummyDescription =
    'Medicine is the science and practice of establishing the diagnosis, prognosis, treatment, and prevention of disease. Medicine encompasses a variety of health care practices evolved to maintain and restore health by the prevention and treatment of illness.';
