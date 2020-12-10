import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/product.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key key,
    @required this.loadedProduct,
  }) : super(key: key);

  final Product loadedProduct;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.loadedProduct.isFavorite
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.redAccent,
      ),
      onPressed: () {
        setState(() {
          //update status         
          widget.loadedProduct.toggleFavoriteStatus();
        });
      },
      iconSize: 40,
      color: Colors.black,
    );
  }
}
