import 'package:cook_with_me/model/post.dart';
import 'package:get/get.dart';

class DetailItemController extends GetxController {
  var post = Post().obs;
  @override
  void onInit() {
    post.value = Get.arguments["post"] as Post;
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
