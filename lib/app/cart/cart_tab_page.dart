import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/cart/components/cart_tile.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/config/app_data.dart' as app_data;
import 'package:quitanda/app/data/model/cart_item_model.dart';

import '../global/payment_dialog.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilServices utilServices = UtilServices();
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      app_data.cartItems.remove(cartItem);
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('shopping'.tr),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: app_data.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                        cartItem: app_data.cartItems[index],
                        remove: removeItemFromCart);
                  }),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'total',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    utilServices.priceToCurrency(cartTotalPrice()),
                    style: TextStyle(
                      fontSize: 24,
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.customSwatchColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                        onPressed: () async {
                          bool? result = await showOrderConfirmation();
                          if (result ?? false) {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return PaymentDialog(
                                    order: app_data.orders.first,
                                  );
                                });
                          }
                        },
                        child: Text(
                          'concludeOrder'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text('confirm'.tr),
            content: Text('concludeOrderConfirmation'.tr),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('no'.tr),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('yes'.tr),
              ),
            ],
          );
        });
  }
}
