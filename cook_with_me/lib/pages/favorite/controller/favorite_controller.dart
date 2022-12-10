import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/API.dart';
import '../../../model/call_api.dart';
import '../../../model/post.dart';

class FavoriteController extends GetxController {
  var listFavorites = List<Post>.empty().obs;
  RxInt lenght = 10.obs;
  @override
  void onInit() async {
    var box = GetStorage();
    //String token = box.read("tkn");
    //print(API.linkFavorite + token);
    listFavorites.value = await CallApi.fetchPost(API.linkFavorite );
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
