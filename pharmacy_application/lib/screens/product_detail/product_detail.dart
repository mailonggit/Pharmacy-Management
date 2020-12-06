import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:pharmacy_application/screens/product_detail/body.dart';


class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({this.product});

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
          SizedBox(width: 10,),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){})
        ],
      ),
      body: Body(product: product,),
    );
  }
}
