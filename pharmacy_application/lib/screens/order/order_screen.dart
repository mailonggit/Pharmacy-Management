import 'package:flutter/material.dart';
import 'package:pharmacy_application/providers/order_provider.dart'
    show OrderProvider;
import 'package:pharmacy_application/screens/home/home_screen.dart';
import 'package:pharmacy_application/screens/order/single_order.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';


  @override
  Widget build(BuildContext context) {
    //final orderData = Provider.of<OrderProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
          color: Colors.black,
        ),
      ),
      //drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context, listen: false).fetchAndSetOrders(),
        builder: (_, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<OrderProvider>(
              builder: (ctx, orderData, child) => ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => SingleOrder(orderData.orders[i], i + 1),
              ),
            );
          }
        },
      ),
    );
  }
}
