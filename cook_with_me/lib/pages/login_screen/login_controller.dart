import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  String notifications = "";
  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var box = GetStorage();
  RxBool isRemmenber = false.obs;
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    // emailController.value.dispose();
    // passController.value.dispose();
    super.onClose();
  }

  initData() {
    emailController.value.text = box.read("email") ?? "";
    passController.value.text = box.read("password") ?? "";
  }
}
