import 'package:flutter/material.dart';
import 'package:pharmacy_application/screens/home/home_screen.dart';
import 'package:pharmacy_application/screens/order/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo[900],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                  maxRadius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Hello Mai Hoang Long',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SelectionTile(
            icon: Icons.shop,
            text: 'Shop',
            press: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          SelectionTile(
            icon: Icons.shopping_cart,
            text: 'Your Order',
            press: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          SelectionTile(
            icon: Icons.lock,
            text: 'Log Out',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class SelectionTile extends StatelessWidget {
  final IconData icon;
  final Function press;
  final String text;
  const SelectionTile({
    this.icon,
    this.press,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        this.icon,
        color: Colors.black,
      ),
      title: Text(
        this.text,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: this.press,
    );
  }
}
