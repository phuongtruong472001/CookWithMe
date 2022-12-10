import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/post.dart';

class HomeController extends GetxController {
  var searchController = TextEditingController().obs;
  var listPosts = List<Post>.empty().obs;
  var keySearch = "".obs;
  var listRecommend=List<Post>.empty().obs;
  @override
  void onInit() async {
    listPosts.value = await CallApi.fetchPost(API.linkPost);
    listRecommend.value=await CallApi.fetchPost(API.linkRecommend);

    super.onInit();
  }

  @override
  void onReady() {}
}
