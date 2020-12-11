import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:pharmacy_application/screens/product_detail/product_detail.dart';
import 'package:pharmacy_application/screens/home/product_item.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context, listen: false);
    final products = productData.products;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Medicine',
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              itemCount: products.length,
              //fix a product was used after being disposed
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: products[i],
                child: ProductItem(),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75, //distance between each product
                crossAxisSpacing: 10,
                mainAxisSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
