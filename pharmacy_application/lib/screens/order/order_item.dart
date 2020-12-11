import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy_application/providers/order_provider.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  final int orderNumber;
  OrderItem(this.order, this.orderNumber);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Order ' +  widget.orderNumber.toString()+ ': \$${widget.order.amount.toStringAsFixed(2)}' ,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Time: ' +
                        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 50,
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
            ),
            if (_expanded)
              Container(
                height: min(widget.order.products.length * 20.0 + 100, 200),
                child: ListView(
                  children: widget.order.products
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  prod.title,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                '${prod.quantity}x \$${prod.price}',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
