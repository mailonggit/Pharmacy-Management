import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/providers/order_provider.dart';
import 'package:provider/provider.dart';


class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final CartProvider cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(16.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.green[900],
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(
              "Order Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
      //check if total amount < 0 then do nothing
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              //loading after user press order button
              setState(() {
                _isLoading = true;
              });

              await Provider.of<OrderProvider>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              //stop loading after adding order
              setState(() {
                _isLoading = false;
              });
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Order Successfully, Please visit Your Order To See It',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.green,
                ),
              );
              widget.cart.clear();
            },
    );
  }
}
