import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/config/app_data.dart' as app_data;
import 'package:quitanda/app/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('orders'.tr),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
          itemCount: app_data.orders.length),
    ));
  }
}
