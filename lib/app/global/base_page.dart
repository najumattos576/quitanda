import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/home/home_tab_page.dart';

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
          children: [
            const HomeTab(),
            Container(color: Colors.green),
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              baseController.jumpToPage(index);
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
