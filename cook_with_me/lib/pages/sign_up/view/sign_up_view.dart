import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

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
                      Text(
                        "Create your account",
                        style: TextStyle(
                          color: HexColor("#000000"),
                          fontFamily: FontsAndColors.semibold,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: Obx(() => Column(
                        children: [
                          editEmail(controller.emailController.value),
                          const SizedBox(
                            height: 10,
                          ),
                          editPassword(controller.newPasswordController.value),
                          const SizedBox(
                            height: 10,
                          ),
                          editPassword(
                              controller.confirmPasswordConTroller.value),
                        ],
                      )),
                ),
                SizedBox(
                  width: Get.width,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: HexColor("#FA6163"),
                        fixedSize: Size(Get.width - 32, 50),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      onPressed: () async {
                        String newPass =
                            controller.newPasswordController.value.text;
                        String confirmPass =
                            controller.confirmPasswordConTroller.value.text;
                        String email = controller.emailController.value.text;
                        if (controller.key.currentState!.validate() &&
                            (newPass == confirmPass)) {
                          controller.key.currentState!.save();
                          bool statusRegister =
                              await CallApi.signUp(email, newPass);
                          if (statusRegister) {
                            showAlertDialog(context);
                          } else {
                            print("loi dang ky");
                          }
                        } else {
                          if (newPass != confirmPass) {
                            print("mat khau khong dung");
                          } else {
                            print("false");
                          }
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontsAndColors.semibold,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
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
            Get.toNamed("/login");
          }
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("OTP code"),
      content: TextFormField(
        controller: controller.otpController.value,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty || value == "") {
            return "Not empty !";
          }
          return null;
        },
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
            keyboardType: TextInputType.text,
            controller: emailController,
            style: TextStyle(
              color: HexColor("#000000"),
              fontFamily: FontsAndColors.semibold,
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
                fontFamily: FontsAndColors.semibold,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || value == "") {
                return "Not empty !";
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Định dạng email không đúng';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget editPassword(TextEditingController passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
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
                hintText: "Enter your password!",
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
              if (value!.isEmpty || value == "") {
                return "Not empty !";
              }

              if (value.length < 8) {
                return 'Password phải từ 8 kí tự trở lên';
              }
              if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(value)) {
                return 'Password phải bao gồm: chữ hoa, thường, số và ký tự dặc biệt';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
