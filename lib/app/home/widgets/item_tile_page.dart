import 'package:flutter/material.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/core/values/colors.dart';

import 'package:quitanda/app/data/model/item_model.dart';

class ItemTilePage extends StatelessWidget {
  final ItemModel item;
  ItemTilePage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(item.imgUrl),
                ),

                //colocar texto a esquerda
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      utilServices.priceToCurrency(item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                      color: CustomColors.customSwatchColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20),
                      )),
                  child: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                    size: 20,
                  )),
            ))
      ],
    ));
  }
}
