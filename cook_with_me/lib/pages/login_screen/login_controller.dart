import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  String notifications = "";
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    emailController.value.dispose();
    passController.value.dispose();
    super.onClose();
  }
}
