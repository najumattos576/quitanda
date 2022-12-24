import 'package:flutter/material.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/data/model/cart_item_model.dart';
import 'package:quitanda/app/home/widgets/quantity_widget.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          leading: Image.asset(
            widget.cartItem.item.imgUrl,
            height: 60,
            width: 60,
          ),
          title: Text(
            widget.cartItem.item.itemName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            utilServices.priceToCurrency(widget.cartItem.totalPrice()),
            style: TextStyle(
                color: CustomColors.customSwatchColor,
                fontWeight: FontWeight.bold),
          ),
          trailing: QuantityWidget(
            suffixText: widget.cartItem.item.unit,
            value: widget.cartItem.quantity,
            result: (quantity) {
              setState(() {
                widget.cartItem.quantity = quantity;

                if (quantity == 0) {
                  widget.remove(widget.cartItem);
                }
              });
            },
            isRemovable: true,
          ),
        ),
      ),
    );
  }
}
