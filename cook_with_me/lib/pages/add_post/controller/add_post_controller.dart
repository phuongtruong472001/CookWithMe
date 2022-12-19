import 'dart:io';
import 'package:cook_with_me/model/call_api.dart';
import 'package:cook_with_me/model/category.dart';
import 'package:cook_with_me/model/post.dart';
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
  final selectedDropdown = "Select category".obs;
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
      menuItems.add(
          DropdownMenuItem(value: cate.name, child: Text(cate.name ?? "")));
    }
  }

  // Future<void> demoUpload(File imgCover,String cate, String name, String ingre, String step, File imgStep,
  //     String linkVid) async {
  //   Steps steps1 = Steps();

  //   // Steps steps = Steps(
  //   //     name: "Rán cá",
  //   //     description: "Rán cá với dầu ăn",
  //   //     imageLink:
  //   //         "https://sohanews.sohacdn.com/2015/4-ran-ca-3-1022-1423120629063.jpg");
  //   // List<Steps> listStep = [];
  //   // listStep.add(steps);
  //   // Ingredients ingredients = Ingredients(
  //   //   name: "Cá",
  //   //   quantity: "1 con",
  //   // );
  //   // List<Ingredients> listIngre = [];
  //   // listIngre.add(ingredients);
  //   // Author author = Author(sId: "6393fc418be579e01a3190bb");
  //   // Post post = Post(
  //   //     author: author,
  //   //     title: "Cá rán",
  //   //     imageCover:
  //   //         "https://sohanews.sohacdn.com/2015/4-ran-ca-3-1022-1423120629063.jpg",
  //   //     ingredients: listIngre,
  //   //     steps: listStep,
  //   //     videoLink:
  //   //         "https://www.youtube.com/watch?v=LuthIO83abw&ab_channel=HandmadeVN");
  //   print("click add item button");
  // return;
  // }
}
