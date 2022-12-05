import 'package:cook_with_me/pages/forgot_password/controller/forgot_password_controller.dart';
import 'package:cook_with_me/pages/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            image: NetworkImage("https://khoinguonsangtao.vn/wp-content/uploads/2022/08/hinh-anh-anime-nu-1.jpg"),
            fit: BoxFit.cover
            ),
        ),
        child: Stack(
          children: const [
            Positioned(
              bottom: 100,
              left: 150,
              right: 150,
              height: 50,
              child: Text("sjdfsd"),
              ),
            Positioned(
              bottom: 200,
              left: 150,
              right: 150,
              height: 50,
              child: Text("sfdfgfhghg"),
              ),
          ],
        ),
      ),
    );
  }
}
