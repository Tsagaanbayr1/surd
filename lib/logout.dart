import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surd/controller.dart';
import 'package:surd/login.dart';
import 'package:surd/password.dart';

class LogoutPage extends StatelessWidget {
  final MyController c = Get.find();

  @override
  Widget build(BuildContext context) {
    c.tries.value = 0;
    Future.delayed(Duration(seconds: 1))
        .then((_) => c.showFindLogout.value = true);

    Future.delayed(Duration(milliseconds: 400))
        .then((_) => c.youGotIt.value = true);

    c.top.value = Get.height / 4;
    c.left.value = Get.width / 4;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('What did you want?'),
                Text(
                  'Kill the app and reopen to access next page',
                  style: TextStyle(fontSize: c.fontSize.value),
                )
              ],
            ),
          ),
          Positioned(
            top: c.top.value,
            left: c.left.value,
            child: InkWell(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              onTap: () => onLoginClicked(c),
            ),
          ),
        ],
      ),
    );
  }

  void onLoginClicked(MyController c) {
    if (c.fontSize >= 10) {
      Get.defaultDialog(
        title: 'Holy',
        textConfirm: 'Shit!',
        textCancel: 'Jesus!',
        content: Container(),
        onConfirm: () => Random().nextInt(2) == 0
            ? Get.to(LoginPage())
            : Get.to(PasswordPage()),
        onCancel: () => Random().nextInt(2) == 0
            ? Get.to(LoginPage())
            : Get.to(PasswordPage()),
      );
    }
    c.fontSize.value++;
    // Random value must not run out of screen
    c.top.value = (Random().nextDouble() - 0.1).abs() * Get.height;
    c.left.value = (Random().nextDouble() - 0.1).abs() * Get.width;
  }
}
