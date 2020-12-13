import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/providers/order_provider.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  final String image;
  final int quantity;
  AddToCart({this.id, this.price, this.title, this.image, this.quantity});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          //add to cart
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.red[900],
              ),
              onPressed: () {
                cart.addItem(
                  this.id,
                  this.price,
                  this.title,
                  this.image,
                  this.quantity,
                );
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added Item To Cart! Please Visit Shopping Cart To See Your List ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.red[900],
                  ),
                );
              },
            ),
          ),
          //buy now button
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  //add this item
                  cart.addItem(
                    this.id,
                    this.price,
                    this.title,
                    this.image,
                    this.quantity,
                  );
                  //add to order
                  Provider.of<OrderProvider>(context, listen: false).addOrder(
                    cart.items.values.toList(),
                    cart.totalAmount,
                  );
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Order Successfully, Please visit Your Order To See It',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.green,
                    ),
                  );
                  cart.clear();
                },
                color: Colors.blue[900],
                child: Text(
                  'Buy Now'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
