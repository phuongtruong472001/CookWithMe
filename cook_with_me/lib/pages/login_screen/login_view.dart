import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:cook_with_me/pages/login_screen/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../snack_bar.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key}) {
    Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    final sizeDefault = MediaQuery.of(context).size;
    bool isLoading = false;
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned(
                top: Get.height / 11,
                child: Text(
                  'Welcome\nBack',
                  style: TextStyle(
                      fontFamily: FontsAndColors.extrabold,
                      fontSize: 28,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Bạn chưa có tài khoản?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      SnackBarSupport.createAndDisplay(
                          context: context,
                          content:
                              "Để đăng ký tài khoản, vui lòng liên hệ Quản trị viên",
                          timeSecond: 3,
                          hideAction: false);
                    },
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.blueAccent,
                          decorationThickness: 1,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              _buildInputForm(
                  controller: controller.userController.value,
                  lable: "Username",
                  isPassword: false),
              _buildInputForm(
                  controller: controller.passController.value,
                  lable: "Password",
                  isPassword: true),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    //logInUser();
                    // context.read<AuthBloc>().add(LoggedInEvent(
                    if (controller.userController.value.text.trim().isEmpty ||
                        controller.passController.value.text.trim().isEmpty) {
                      SnackBarSupport.createAndDisplay(
                          context: context,
                          content:
                              "Vui lòng nhập thông tin tài khoản và mật khẩu",
                          timeSecond: 3,
                          hideAction: true);
                    } else {
                      logIn(
                        controller.userController.value.text,
                        controller.passController.value.text,
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF111111)),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.grey),
                    ),
                  )),
              SizedBox(
                height: sizeDefault.height * 0.1,
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> logIn(String username, String password) async {}

  Padding _buildInputForm({
    required TextEditingController controller,
    required String lable,
    required bool isPassword,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        // textInputAction: TextInputAction.previous,
        keyboardType: TextInputType.text,
        showCursor: true,
        obscureText: isPassword,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 19,
            color: Colors.black,
            letterSpacing: 0.9),
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(
              fontFamily: FontsAndColors.extrabold,
              fontSize: 14,
              color: Colors.black),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF111111))),
        ),
      ),
    );
  }
}
