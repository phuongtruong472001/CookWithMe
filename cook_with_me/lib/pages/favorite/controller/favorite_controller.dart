import 'package:get/get.dart';

import '../../../model/post.dart';

class FavoriteController extends GetxController {
  var listFavorites = List<Post>.empty().obs;
  RxInt lenght = 10.obs;
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
