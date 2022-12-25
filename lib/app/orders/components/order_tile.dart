import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quitanda/app/config/app_data.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/data/model/cart_item_model.dart';
import 'package:quitanda/app/data/model/order_model.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);
  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pedido:${order.id}'.tr),
                Text(
                  utilServices.formatDateTime(order.createdDateTime),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: ListView(
                          children: order.items.map((orderItem) {
                            return _OrderItemWidget(
                              utilServices: utilServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.red,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
