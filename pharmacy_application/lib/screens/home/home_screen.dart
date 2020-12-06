import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/home/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}

buildAppBar() {
  return AppBar(
    backgroundColor: Colors.blue[200],
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {},
      ),
    ],
  );  
}
