import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var emailController = TextEditingController().obs;
  var otpController = TextEditingController().obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    // emailController.value.dispose();
    // otpController.value.dispose();
    super.onClose();
  }
  // String validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return "Not empty !";
  //   }
  //   return "";
  // }
  // String validateOTP(String value) {
  //   if (value.isEmpty) {
  //     return "Not empty !";
  //   }
  //   return "";
  // }
}
