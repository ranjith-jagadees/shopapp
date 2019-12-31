import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/order.dart' show Order;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orderscreen';
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (ctx, i)=>OrderItem(order.orders[i]),
      ),
    );
  }
}
