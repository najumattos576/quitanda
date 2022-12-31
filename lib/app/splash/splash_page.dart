import 'package:flutter/material.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/global/app_name_widget.dart';
import 'package:quitanda/app/login/signIn/signIn_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return const SignIn();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      CustomColors.customSwatchColor,
                      CustomColors.customSwatchColor.shade400,
                    ]),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppNameWidget(
                    greenTitleColor: Colors.white,
                    textSize: 40,
                  ),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                ],
              ))),
    );
  }
}
