import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:cook_with_me/pages/login_screen/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../snack_bar.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key}) {
    Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    // final sizeDefault = MediaQuery.of(context).size;
    // bool isLoading = false;
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_login_screen.png"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50, bottom: 10),
                        child: Text(
                          "Welcome back!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        "You don’t need a silver folk to eat good food",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.red),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    activeColor: Colors.white,
                                    value: true,
                                    onChanged: (bool? value) {
                                      print("check box was checked");
                                    }),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Login my account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Create new account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ]),
              ),
            ),
          )),
    );
    // TODO: implement build
    // return Scaffold(
    //     body: SafeArea(
    //   child: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 25),
    //       child: Stack(
    //         alignment: Alignment.bottomLeft,
    //         children: [
    //           Positioned(
    //             top: Get.height / 11,
    //             child: Text(
    //               'Welcome\nBack',
    //               style: TextStyle(
    //                   fontFamily: FontsAndColors.bold,
    //                   fontSize: 28,
    //                   color: Colors.black),
    //             ),
    //           ),

    //           Row(
    //             children: [
    //               const Text(
    //                 'Bạn chưa có tài khoản?',
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 17,
    //                     color: Colors.black),
    //               ),
    //               const SizedBox(
    //                 width: 5,
    //               ),
    //               GestureDetector(
    //                 onTap: () {
    //                   SnackBarSupport.createAndDisplay(
    //                       context: context,
    //                       content:
    //                           "Để đăng ký tài khoản, vui lòng liên hệ Quản trị viên",
    //                       timeSecond: 3,
    //                       hideAction: false);
    //                 },
    //                 child: const Text(
    //                   'Đăng ký',
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 17,
    //                       color: Colors.blueAccent,
    //                       decorationThickness: 1,
    //                       decoration: TextDecoration.underline),
    //                 ),
    //               )
    //             ],
    //           ),
    //           _buildInputForm(
    //               controller: controller.userController.value,
    //               lable: "Username",
    //               isPassword: false),
    //           _buildInputForm(
    //               controller: controller.passController.value,
    //               lable: "Password",
    //               isPassword: true),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           InkWell(
    //               onTap: () async {
    //                 //logInUser();
    //                 // context.read<AuthBloc>().add(LoggedInEvent(
    //                 if (controller.userController.value.text.trim().isEmpty ||
    //                     controller.passController.value.text.trim().isEmpty) {
    //                   SnackBarSupport.createAndDisplay(
    //                       context: context,
    //                       content:
    //                           "Vui lòng nhập thông tin tài khoản và mật khẩu",
    //                       timeSecond: 3,
    //                       hideAction: true);
    //                 } else {
    //                   logIn(
    //                     controller.userController.value.text,
    //                     controller.passController.value.text,
    //                   );
    //                 }
    //               },
    //               borderRadius: BorderRadius.circular(15),
    //               child: Container(
    //                 alignment: Alignment.center,
    //                 height: MediaQuery.of(context).size.height * 0.065,
    //                 width: double.infinity,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15),
    //                     color: const Color(0xFF111111)),
    //                 child: const Text(
    //                   "Đăng nhập",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 19,
    //                       color: Colors.grey),
    //                 ),
    //               )),
    //           SizedBox(
    //             height: sizeDefault.height * 0.1,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ));
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
