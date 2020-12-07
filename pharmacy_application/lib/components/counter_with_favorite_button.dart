import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/cart_counter.dart';

class CounterWithFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CartCounter(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(                            
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}