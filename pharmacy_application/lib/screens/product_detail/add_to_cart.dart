import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:provider/provider.dart';

class AddToCart extends StatelessWidget {
  final String id;
  final double price;
  final String title;
  AddToCart({this.id, this.price, this.title});
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
                print('press');
                cart.addItem(this.id, this.price, this.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added item to cart!',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                    // action: SnackBarAction(
                    //   label: 'Undo',
                    //   onPressed: () {
                    //     cart.removeSingleItem(product.id);
                    //   },
                    // ),
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
                onPressed: () {},
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
