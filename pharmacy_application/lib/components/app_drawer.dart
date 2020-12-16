import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/auth_provider.dart';
import 'package:pharmacy_application/screens/home/home_screen.dart';
import 'package:pharmacy_application/screens/manage/edit_product_screen.dart';
import 'package:pharmacy_application/screens/manage/manage_product.dart';
import 'package:pharmacy_application/screens/order/order_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final isAdmin;
  AppDrawer({this.isAdmin});
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
                    'Hello Bro',
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
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),     
          SelectionTile(
            icon: Icons.shopping_cart,
            text: 'Your Order',
            press: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          
          isAdmin
              ? SelectionTile(
                  icon: Icons.add_box,
                  text: 'Create Product',
                  press: () {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(EditProductScreen.routeName);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProductScreen(
                                  isEdit: false,
                                )));
                  },
                )
              : SizedBox(height: 1),
          isAdmin
              ? SelectionTile(
                  icon: Icons.settings,
                  text: 'Manage Medicine',
                  press: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ManageProductScreen.routeName);
                  },
                )
              : SizedBox(height: 1),
          SelectionTile(
            icon: Icons.lock,
            text: 'Log Out',
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
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
    return Column(
      children: <Widget>[
        
        ListTile(
          leading: Icon(
            this.icon,
            color: Colors.black,
          ),
          title: Text(
            this.text,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          onTap: this.press,
        ),
        
      ],
    );
  }
}
