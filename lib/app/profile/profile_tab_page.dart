import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/app/global/custom_text_field.dart';
import 'package:quitanda/app/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                  Icons.translate,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                ))
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            CustomTextField(
              readyOnly: true,
              initialvalue: app_data.user.email,
              icon: Icons.email,
              label: 'Email',
            ),
            CustomTextField(
              readyOnly: true,
              initialvalue: app_data.user.name,
              icon: Icons.person,
              label: 'name'.tr,
            ),
            CustomTextField(
              readyOnly: true,
              initialvalue: app_data.user.phone,
              icon: Icons.phone,
              label: 'phone'.tr,
            ),
            CustomTextField(
              readyOnly: true,
              initialvalue: app_data.user.cpf,
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),
            SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  updatePassword();
                },
                child: Text('passWordUpgrade'.tr),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Text('passwordUpgrade'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      CustomTextField(
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'currentPassword'.tr,
                      ),
                      CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outlined,
                        label: 'newPassword'.tr,
                      ),
                      CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outlined,
                        label: 'confirmNewPassword'.tr,
                      ),
                      SizedBox(
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                              onPressed: () {},
                              child: Text('upgrade'.tr)))
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
