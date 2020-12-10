import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/cart_counter.dart';
import 'package:pharmacy_application/components/favorite_button.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CounterWithFavorite extends StatelessWidget {
  final String id;
  CounterWithFavorite({this.id});

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(this.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(loadedProduct: loadedProduct,),
        FavoriteButton(loadedProduct: loadedProduct),
      ],
    );
  }
}


