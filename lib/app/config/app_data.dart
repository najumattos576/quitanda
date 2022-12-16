import 'package:get/get.dart';

import '../data/model/item_model.dart';

ItemModel apple = ItemModel(
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'apple'.tr,
  price: (5.5),
  unit: 'Kg',
  description: 'appleDescription'.tr,
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'grape'.tr,
  price: 7.4,
  unit: 'kg',
  description: 'grapeDescription'.tr,
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'guava'.tr,
  price: 11.5,
  unit: 'kg',
  description: 'guavaDescription'.tr,
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description: 'kiwiDescription'.tr,
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'mango'.tr,
  price: 2.5,
  unit: 'un',
  description: 'mangoDescription'.tr,
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'papaya'.tr,
  price: 8,
  unit: 'kg',
  description: 'papayaDescription'.tr,
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'fruits',
  'grains',
  'greens',
  'condiments',
  'cereals',
];

// Produtos.txt
// Exibindo Produtos.txt…