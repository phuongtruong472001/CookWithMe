import 'dart:io';
import 'package:cook_with_me/model/call_api.dart';
import 'package:cook_with_me/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  // get image food
  File? image;
  final picker = ImagePicker();
  File? image1;
  final picker1 = ImagePicker();
// get category for dropdown
  var listCategory = List<Category>.empty().obs;
  RxString selectedDropdown = "Select category".obs;
  var menuItems = List<DropdownMenuItem<String>>.empty().obs;

//get name, Ingredients
  final nameController = TextEditingController().obs;
  final ingredientsController = TextEditingController().obs;
  final step1Controller = TextEditingController().obs;
  final linkVideoController = TextEditingController().obs;

  @override
  void onInit() async {
    listCategory.value = await CallApi.fetchCategory();
    getDataCategoty();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final imageTemp =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageTemp == null) {
        return;
      }
      image = File(imageTemp.path);
    } catch (e) {
      print(e);
    }
    update();
  }
  Future<void> getImage1(ImageSource source) async {
    try {
      final imageTemp =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageTemp == null) {
        return;
      }
      image1 = File(imageTemp.path);
    } catch (e) {
      print(e);
    }
    update();
  }

  void getDataCategoty() {
    for (var cate in listCategory) {
      menuItems
          .add(DropdownMenuItem(value: cate.sId, child: Text(cate.name ?? "")));
    }
  }

  void changeValueDropdown(String value) {
    if (value.isNotEmpty) {
      selectedDropdown.value = value;
    }
  }
}
