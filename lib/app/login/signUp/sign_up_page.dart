import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/app/core/values/colors.dart';
import 'package:quitanda/app/global/custom_text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  //mascaras
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '+55 (##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
//mascaras
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'cadastre'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            icon: Icons.email,
                            label: 'Email'.tr,
                          ),
                          CustomTextField(
                            icon: Icons.lock,
                            label: 'password'.tr,
                            isSecret: true,
                          ),
                          CustomTextField(
                            icon: Icons.person,
                            label: 'name'.tr,
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'phone'.tr,
                            inputFormatters: [phoneFormatter],
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF'.tr,
                            inputFormatters: [cpfFormatter],
                          ),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'cadastre'.tr,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
