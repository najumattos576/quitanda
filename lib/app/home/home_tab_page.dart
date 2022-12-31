import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/config/app_data.dart' as app_data;
import 'package:quitanda/app/core/utils/utils_services.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/global/app_name_widget.dart';
import 'package:quitanda/app/global/custom_shimmer.dart';
import 'package:quitanda/app/home/widgets/category_tile_page.dart';
import 'package:quitanda/app/home/widgets/item_tile_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'fruits';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  final UtilServices utilServices = UtilServices();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const AppNameWidget(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
              ),
              child: GestureDetector(
                  onTap: () {},
                  child: Badge(
                    badgeColor: CustomColors.customContrastColor,
                    badgeContent: const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    child: AddToCartIcon(
                      key: globalKeyCartItems,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                  )),
            )
          ],
        ),
        body: AddToCartAnimation(
          gkCart: globalKeyCartItems,
          previewCurve: Curves.ease,
          previewDuration: const Duration(milliseconds: 100),
          receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
            runAddToCardAnimation = addToCardAnimationMethod;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'search'.tr,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.customContrastColor,
                        size: 21,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 40,
                child: !isLoading
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CategoryTile(
                            onPressed: () {
                              setState(() {
                                selectedCategory = app_data.categories[index];
                              });
                            },
                            category: app_data.categories[index],
                            isSelected:
                                app_data.categories[index] == selectedCategory,
                          );
                        },
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 10),
                        itemCount: app_data.categories.length,
                      )
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: CustomShimmer(
                                    height: 20,
                                    width: 80,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                      ),
              ),
              Expanded(
                child: !isLoading
                    ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                        ),
                        itemCount: app_data.items.length,
                        itemBuilder: (_, index) {
                          return ItemTilePage(
                              item: app_data.items[index],
                              cartAnimationMethod: itemSelectedCartAnimation);
                        },
                      )
                    : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                          10,
                          (index) => CustomShimmer(
                            height: double.infinity,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
