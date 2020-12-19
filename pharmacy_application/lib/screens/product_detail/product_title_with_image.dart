import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductTitleWithImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              loadedProduct.title,
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: 'Price\n', style: TextStyle(fontSize: 20)),
                  TextSpan(
                    text: '\$${loadedProduct.price.toString()}',
                    style: Theme.of(context).textTheme.headline.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ])),
              ),
              SizedBox(
                width: 80,
              ),
              Expanded(
                  child: Image.network(
                loadedProduct.image,
                fit: BoxFit.fitWidth,
                width: 100,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
