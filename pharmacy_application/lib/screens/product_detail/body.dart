import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/cart_counter.dart';
import 'package:pharmacy_application/components/counter_with_favorite_button.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:pharmacy_application/screens/product_detail/add_to_cart.dart';
import 'package:pharmacy_application/screens/product_detail/description.dart';
import 'package:pharmacy_application/screens/product_detail/product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Description(product: product),
                      ),
                      CounterWithFavorite(),
                      AddToCart(),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}


