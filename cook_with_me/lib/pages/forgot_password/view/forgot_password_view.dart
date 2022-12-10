import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../model/call_api.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.key,
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        "Forgot password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: Obx(() => editEmail(controller.emailController.value)),
                ),
                SizedBox(
                  width: Get.width,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black87,
                        fixedSize: Size(Get.width - 32, 50),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      onPressed: () async {
                        if (controller.key.currentState!.validate()) {
                          controller.key.currentState!.save();
                          bool statusCheckOTP = await CallApi.sendOTP(
                              controller.emailController.value.text.trim());
                          if (statusCheckOTP) {
                            showAlertDialog(context);
                          }
                        }
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () async {
        if (controller.key.currentState!.validate()) {
          controller.key.currentState!.save();
          bool statusCheckOTP = await CallApi.checkOTP(
              controller.emailController.value.text,
              controller.otpController.value.text);
          if (statusCheckOTP) {
            Get.toNamed("/change_password",
                arguments: {"email": controller.emailController.value.text});
          }
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("OTP code"),
      content: TextField(
        controller: controller.otpController.value,
        keyboardType: TextInputType.number,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget editEmail(TextEditingController emailController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
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
