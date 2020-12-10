import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/cart_counter.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;

  const CartItem({Key key, this.id, this.title, this.quantity, this.price, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var totalAmount = this.price * this.quantity;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            //image
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(20.0),                            
              ),
              child: this.image != null
                  ? Image.asset(
                      this.image,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            const SizedBox(width: 20.0),
            //cart counter
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 40.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          iconSize: 18.0,
                          padding: const EdgeInsets.all(2.0),
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        Text(
                          "${this.quantity}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        IconButton(
                          iconSize: 18.0,
                          padding: const EdgeInsets.all(2.0),
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "\$${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {

                },
                iconSize: 30,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
