import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController().obs;
  var newPasswordController = TextEditingController().obs;
  var confirmPasswordConTroller = TextEditingController().obs;
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
    emailController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordConTroller.value.dispose();
    super.onClose();
  }

  String validateEmail(String value) {
    if (value.isEmpty || value == "") {
      return "Not empty !";
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Định dạng email không đúng';
    }
    return "";
  }

  String validatePassword(String value) {
    if (value.isEmpty || value == "") {
      return "Not empty !";
    }

    if (value.length < 8) {
      return 'Password phải từ 8 kí tự trở lên';
    }
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'Password phải bao gồm: chữ hoa, thường, số và ký tự dặc biệt';
    }
    return "";
  }
}
