import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/cart_provider.dart';
import 'package:pharmacy_application/providers/order_provider.dart';
import 'package:pharmacy_application/providers/product.dart';
import 'package:pharmacy_application/providers/product_provider.dart';
import 'package:pharmacy_application/screens/cart/cart_screen.dart';
import 'package:pharmacy_application/screens/home/home_screen.dart';
import 'package:pharmacy_application/screens/login/login.dart';
import 'package:pharmacy_application/screens/manage/edit_product_screen.dart';
import 'package:pharmacy_application/screens/manage/manage_product.dart';
import 'package:pharmacy_application/screens/order/order_screen.dart';
import 'package:pharmacy_application/screens/product_detail/product_detail.dart';
import 'package:pharmacy_application/screens/signup/signup.dart';
import 'package:pharmacy_application/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //avoid cannot find correct provider
      providers: [
        ChangeNotifierProvider.value(
          value: ProductProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: OrderProvider(),        
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Welcome(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          Login.routeName: (ctx) => Login(),
          SignUp.routeName: (ctx) => SignUp(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
          ManageProductScreen.routeName: (ctx) => ManageProductScreen(),
        },
      ),
    );
  }
}
