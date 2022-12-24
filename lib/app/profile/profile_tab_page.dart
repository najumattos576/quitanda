import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('profile'.tr),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.language,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
    ));
  }
}
