import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/data/model/item_model.dart';
import 'package:quitanda/app/home/widgets/quantity_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final UtilServices utilsServices = UtilServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withAlpha(230),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.asset(widget.item.imgUrl)),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(widget.item.itemName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: ((quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            }),
                          ),
                        ],
                      ),
                      Text(utilsServices.priceToCurrency(widget.item.price),
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor,
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                          onPressed: () {},
                          label: Text('shoppingButtom'.tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
