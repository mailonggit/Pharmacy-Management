import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/badge.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/screens/cart/CartScreen.dart';
import 'package:pharmacy_application/screens/product_detail/body.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          SizedBox(
            width: 10,
          ),
          //shopping cart button
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('press');
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: Body(),
    );
  }
}
