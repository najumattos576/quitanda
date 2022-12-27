import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';

import 'package:quitanda/app/data/model/order_model.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  PaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);
  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'paymentWithPix'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  QrImage(
                    data: "123as4da78as90",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Text(
                    'Vencimento: ${utilServices.formatDateTime(order.overdueDateTime)}'
                        .tr,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Total: ${utilServices.priceToCurrency(order.total)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.green,
                          )),
                      onPressed: () {},
                      icon: const Icon(Icons.copy),
                      label: Text(
                        'copyPixKey'.tr,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ))
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
