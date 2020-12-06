import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product.dart';


class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.description,
      style: TextStyle(fontSize: 15, height: 1.5),
    );
  }
}