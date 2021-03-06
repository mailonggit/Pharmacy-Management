import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/cart_provider.dart'
    show CartProvider;
import 'package:pharmacy_application/screens/cart/single_cart.dart';
import 'package:pharmacy_application/screens/cart/order_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context,
        listen: true); // rebult this widget when changes occur
    //It's took me so long to fix this bug
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Your Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => SingleCart(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                title: cart.items.values.toList()[i].title,
                quantity: cart.items.values.toList()[i].quantity,
                price: cart.items.values.toList()[i].price,
                image: cart.items.values.toList()[i].image,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(width: 40.0),
              Text(
                "Total",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                "\$${cart.totalAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Container(
              width: double.infinity,
              child: OrderButton(cart: cart),
            ),
          ),
        ],
      ),
    );
  }
}


