import 'package:cook_with_me/pages/favorite/controller/favorite_controller.dart';
import 'package:cook_with_me/pages/home/controller/home_controller.dart';
import 'package:cook_with_me/pages/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class TabBarHomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  @override
  void onReady() {}

  void onItemTapped(int index) {
    currentIndex.value = index;
    if (index == 1) {
      Get.find<FavoriteController>().loadData();
    }
    if (index == 2) {
      Get.find<SettingsController>().loadData();
    }
  }
}
