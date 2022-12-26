import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/data/model/cart_item_model.dart';
import 'package:quitanda/app/data/model/order_model.dart';
import 'package:quitanda/app/global/payment_dialog.dart';

import 'order_status_widget.dart';

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
            initiallyExpanded: order.status == 'pending_payment',
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('order: ${order.id}'.tr),
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
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 150,
                          child: ListView(
                            children: order.items.map((orderItem) {
                              return _OrderItemWidget(
                                utilServices: utilServices,
                                orderItem: orderItem,
                              );
                            }).toList(),
                          ),
                        )),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 2,
                      width: 8,
                    ),
                    Expanded(
                      flex: 2,
                      child: OrderStatus(
                          status: order.status,
                          isOverdue: order.overdueDateTime.isBefore(
                            DateTime.now(),
                          )),
                    )
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Total ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: utilServices.priceToCurrency(order.total)),
                    ]),
              ),
              Visibility(
                visible: order.status == 'pending_payment',
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return PaymentDialog(
                            order: order,
                          );
                        });
                  },
                  icon: Image.asset(
                    'assets/app_images/pix.png',
                    height: 18,
                  ),
                  label: Text('Ver QR code Pix'.tr),
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
            '${orderItem.quantity}${orderItem.item.unit} ',
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
