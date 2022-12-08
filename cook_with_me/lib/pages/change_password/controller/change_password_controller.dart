import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var newPasswordController = TextEditingController().obs;
  var confirmPasswordConTroller = TextEditingController().obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
