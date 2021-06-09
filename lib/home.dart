import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surd/controller.dart';
import 'package:surd/logout.dart';

class HomePage extends StatelessWidget {
  final MyController c = Get.find();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1))
        .then((_) => c.showFindLogout.value = true);

    Future.delayed(Duration(milliseconds: 400))
        .then((_) => c.youGotIt.value = true);
    c.tries.value = 0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations!!!\n You got it',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: c.showFindLogout.value
                  ? Text('Just find out the logout button.')
                  : SizedBox(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(width: Get.width),
                  TextButton(
                    child: Text('Logout'),
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Are you raelly want it?',
                        content: Text('Pick the right choice!'),
                        textCancel: 'Yes',
                        textConfirm: 'Yes',
                        onCancel: () => Random().nextInt(100) <= c.tries.value
                            ? Get.to(LogoutPage())
                            : Get.back(closeOverlays: true),
                        onConfirm: () => Random().nextInt(100) <= c.tries.value
                            ? Get.to(LogoutPage())
                            : Get.back(closeOverlays: true),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
