import 'package:flutter/material.dart';


class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  var numberOfItem = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(Icons.remove, () {
          if (numberOfItem > 1) {
            setState(() {
              numberOfItem--;
            });
          }
        }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            //show 0 before number if it less than 10
            numberOfItem.toString().padLeft(2, '0'),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        buildOutlineButton(Icons.add, () {
          setState(() {
            numberOfItem++;
          });
        }),
      ],
    );
  }

  buildOutlineButton(IconData icon, Function press) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        onPressed: press,
        child: Icon(icon),      
      ),
    );
  }
}
