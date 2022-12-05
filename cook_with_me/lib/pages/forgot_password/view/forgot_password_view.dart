import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.key,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                child: SizedBox(
                  width: Get.width,
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        "Forgot password",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: Get.height / 4,
                child: SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: Obx(() => editEmail(controller.emailController.value)),
                ),
              ),
              Positioned(
                  bottom: Get.height / 6,
                  child: SizedBox(
                    width: Get.width,
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black87,
                          fixedSize: Size(Get.width - 32, 50),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                        onPressed: () {
                          if (controller.key.currentState!.validate()) {
                            controller.key.currentState!.save();
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ),),
                  Positioned(child: Container())
            ],
          ),
        ),
      ),
    );
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter the name !";
    }
    return "";
  }

  Widget editEmail(TextEditingController emailController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextFormField(
            controller: emailController,
            style: TextStyle(
              color: HexColor("#000000"),
              fontFamily: 'Nunito-Semibold',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter your email!",
                hintStyle: TextStyle(
                  color: HexColor("#C1C1C1"),
                  fontFamily: 'Nunito-Semibold',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(16))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name.';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
