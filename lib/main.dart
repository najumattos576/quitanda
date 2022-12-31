import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Quitanda'.tr,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(190),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage());
  }
}
