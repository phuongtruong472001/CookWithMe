import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../model/call_api.dart';
import '../controller/change_password_controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

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
                        "Change Password",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height / 2,
                  width: Get.width,
                  child: Obx(() => Column(
                        children: [
                          editNewPassword(
                              controller.newPasswordController.value, 1),
                          const SizedBox(
                            height: 20,
                          ),
                          editNewPassword(
                              controller.confirmPasswordConTroller.value, 2),
                        ],
                      )),
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
                        
                        String newPass =
                            controller.newPasswordController.value.text;
                        String confirmPass =
                            controller.confirmPasswordConTroller.value.text;

                        if (controller.key.currentState!.validate() &&
                            (newPass == confirmPass)) {
                          controller.key.currentState!.save();
                          bool statusRegister =
                              await CallApi.signUp("", newPass);
                          
                          if (statusRegister) {
                            Get.toNamed("/main_tabbar");
                          } else {
                            print("loi dang ky");
                          }
                        } else {
                          print("false");
                        }
                      },
                      child: const Text('Change password'),
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

  Widget editNewPassword(TextEditingController emailController, int index) {
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
                hintText:
                    index == 1 ? "Enter your new password" : "Confirm password",
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
