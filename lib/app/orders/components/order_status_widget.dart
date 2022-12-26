import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quitanda/app/core/values/colors.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatus({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(
          title: 'confirmedOrder'.tr,
          isActive: true,
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          _StatusDot(
            isActive: true,
            title: 'reversedPix'.tr,
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          _StatusDot(
            isActive: true,
            title: 'pixPaymentDue'.tr,
            backgroundColor: Colors.red,
          ),
        ] else ...{
          _StatusDot(
            isActive: currentStatus >= 2,
            title: ('payment').tr,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 3,
            title: ('preparing').tr,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 4,
            title: ('sent').tr,
          ),
          const _CustomDivider(),
          _StatusDot(
            isActive: currentStatus >= 5,
            title: ('delivered').tr,
          ),
        }
      ],
    ));
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        height: 10,
        width: 2,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
