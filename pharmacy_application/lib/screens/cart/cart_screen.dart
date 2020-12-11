import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/order_provider.dart';
import 'package:pharmacy_application/screens/cart/body.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
      ),
      extendBody: true,
      body: Body(),
    );
  }
}
