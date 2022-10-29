import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  String notifications = "";
  final userController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final box = GetStorage();
  @override
  void onInit() {
    initDefaultValue();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    userController.value.dispose();
    passController.value.dispose();
    super.onClose();
  }

  initDefaultValue() async {
    String usernameSave = box.read("username") ?? '';
    String passwordSave = box.read("username") ?? '';
    userController.value.text = usernameSave;
    passController.value.text = passwordSave;
  }
}
