import 'package:cook_with_me/pages/forgot_password/controller/forgot_password_controller.dart';
import 'package:cook_with_me/pages/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/call_api.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        // width: double.infinity,
        // height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_splash_screen.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/login");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFD1616),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed("/sign_up");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
