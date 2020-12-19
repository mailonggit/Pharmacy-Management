import 'package:flutter/material.dart';
import 'package:pharmacy_application/widgets/app_drawer.dart';
import 'package:pharmacy_application/widgets/badge.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/screens/cart/cart_screen.dart';
import 'package:pharmacy_application/screens/home/body.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final bool isAdmin;
  HomeScreen({this.isAdmin = false});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
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
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(isAdmin: this.isAdmin,),
      body: Body(),
    );
  }
}
