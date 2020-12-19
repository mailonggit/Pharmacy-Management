import 'package:flutter/material.dart';
import 'package:pharmacy_application/models/product.dart';
import 'package:pharmacy_application/screens/product_detail/product_detail.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);    
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: product.id),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //product image
          Expanded(
            child: Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                product.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
              child: Text(
                product.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
