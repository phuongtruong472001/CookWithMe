import 'package:cook_with_me/model/call_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/API.dart';
import '../../../model/post.dart';

class HomeController extends GetxController {
  var searchController = TextEditingController().obs;
  var listPosts = List<Post>.empty().obs;
  @override
  void onInit() async{
    listPosts.value =await CallApi.fetchAreas();
    super.onInit();
    
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
