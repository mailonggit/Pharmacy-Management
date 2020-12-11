import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/app_drawer.dart';
import 'package:pharmacy_application/providers/order_provider.dart'
    show OrderProvider;
import 'package:pharmacy_application/screens/home/home_screen.dart';
import 'package:pharmacy_application/screens/order/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,        
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i], i + 1),
      ),
    );
  }
}
