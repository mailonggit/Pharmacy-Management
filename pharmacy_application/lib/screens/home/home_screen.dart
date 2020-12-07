import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/app_drawer.dart';
import 'package:pharmacy_application/components/badge.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/screens/CartScreen.dart';
import 'package:pharmacy_application/screens/home/body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: buildAppBar(),
      drawer: AppDrawer(),
      body: Body(),
    );
  }
}

buildAppBar() {
  return AppBar(
    backgroundColor: Colors.indigo[900],
    elevation: 0,
    actions: <Widget>[
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
            //Navigator.of(context).pushNamed(CartScreen.routeName);
          },
        ),
      ),
    ],
  );
}
