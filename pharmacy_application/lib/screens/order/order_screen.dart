import 'package:flutter/material.dart';
import 'package:pharmacy_application/components/app_drawer.dart';
import 'package:pharmacy_application/providers/order_provider.dart'
    show OrderProvider;
import 'package:pharmacy_application/screens/order/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   Future _orderFuture;

//   Future _obtainOrderFuture() {
//     return Provider.of<OrderProvider>(context, listen: false)
//         .fetchAndSetOrders();
//   }

//   @override
//   void initState() {
//     _orderFuture = _obtainOrderFuture();
//     super.initState();
//   }

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
      ),
      drawer: AppDrawer(),
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
                itemBuilder: (ctx, i) => OrderItem(orderData.orders[i], i + 1),
              ),
            );
          }
        },
      ),
    );
  }
}
