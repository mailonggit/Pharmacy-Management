import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/product_detail/product_detail.dart';
import 'package:pharmacy_application/screens/home/product_item.dart';
import 'package:pharmacy_application/providers/product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Medicine',
            style: Theme.of(context).textTheme.headline.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75, //distance between each product
                crossAxisSpacing: 10,
                mainAxisSpacing: 0.5,
              ),
              itemBuilder: (context, index) => ProductItem(
                  product: products[index],
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetail(product: products[index],)));
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
