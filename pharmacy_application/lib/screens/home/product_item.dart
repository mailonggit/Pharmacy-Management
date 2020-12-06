import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function press;

  const ProductItem({
    this.press,
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.press,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
                    child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            '\$${product.price.toString()}',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}