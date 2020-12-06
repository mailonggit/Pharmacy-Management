import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: 'Price\n', style: TextStyle(fontSize: 20)),
                  TextSpan(
                    text: '\$${product.price.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, 
                            fontSize: 30),
                  ),
                ])),
              ),
              SizedBox(width: 100,),
              Expanded(child: Image.asset(product.image, fit: BoxFit.fill,)),
            ],
          ),
        ],
      ),
    );
  }
}
