import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surd/controller.dart';
import 'package:surd/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myController = Get.put(MyController());
    myController.top.value = Get.height / 2;
    myController.left.value = Get.width / 2;
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: GetX<MyController>(
          builder: (c) => Stack(
            children: [
              if (c.tries.value == 0)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Username'),
                          validator: ((v) =>
                              v == 'Username' ? null : 'Username'),
                          autovalidateMode: c.autoValidate.value
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password123'),
                          validator: ((v) =>
                              v == 'Password123' ? null : 'Password123'),
                          autovalidateMode: c.autoValidate.value
                              ? AutovalidateMode.always
                              : AutovalidateMode.disabled,
                        ),
                        TextButton(
                          child: Text('Sign In'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              onLoginClicked(c);
                            } else {
                              c.autoValidate.value = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (c.tries.value > 0)
                Positioned(
                  top: c.top.value,
                  left: c.left.value,
                  child: TextButton(
                    child: Text('Sign In'),
                    onPressed: () => onLoginClicked(c),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginClicked(MyController c) {
    if (Random().nextInt(100) <= c.tries.value) {
      Get.to(HomePage());
    } else {
      // Increase chance or never get it
      c.tries++;

      // Random value must not run out of screen
      c.top.value = (Random().nextDouble() - 0.1).abs() * Get.height;
      c.left.value = (Random().nextDouble() - 0.1).abs() * Get.width;
    }
  }
}
