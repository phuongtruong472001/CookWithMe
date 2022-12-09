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
  var text = "";
  bool fileLoaded = false;
// get category for dropdown
  var listCategory = List<Category>.empty().obs;

  var menuItems = List<DropdownMenuItem<String>>.empty().obs;
  //   DropdownMenuItem(value: "Khai_vi", child: Text("Khai vi")),
  //   DropdownMenuItem(value: "Mon_chinh", child: Text("Mon chinh")),
  //   DropdownMenuItem(value: "Trang_mieng", child: Text("Trang mieng")),
  //   DropdownMenuItem(value: "An_vat", child: Text("An vat")),
  // ];
//get name, Ingredients

  @override
  void onInit() async {
    listCategory.value = await CallApi.fetchCategory();
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
    } catch (_) {
      print("sjgdf");
    }
    update();
  }

  void getDataCategoty() {
    for (var cate in listCategory) {
      menuItems.add(DropdownMenuItem(value: cate.sId, child: Text(cate.name??"")));
    }
  }
}
