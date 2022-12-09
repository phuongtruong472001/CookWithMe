import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/API.dart';
import '../../../model/call_api.dart';
import '../../../model/post.dart';

class AllFoodController extends GetxController {
  var listPosts = List<Post>.empty().obs;
  var box = GetStorage();
  @override
  void onInit() async {
    String id = box.read("user_id");
    listPosts.value = await CallApi.fetchPost(API.linkPostOfMe + id);
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
