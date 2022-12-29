import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/cart/cart_tab_page.dart';
import 'package:quitanda/app/home/home_tab_page.dart';
import 'package:quitanda/app/orders/orders_tab_page.dart';

import '../profile/profile_tab_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final baseController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: baseController,
          children: const [
            HomeTab(),
            CartTab(),
            OrdersTab(),
            ProfileTab(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              //baseController.jumpToPage(index);
              baseController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuart,
              );
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(100),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: ('home'.tr),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined),
              label: ('shopping'.tr),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: ('request'.tr),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: ('profile'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
