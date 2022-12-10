import 'package:get/get.dart';

class TabBarHomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  @override
  void onReady() {}

  void onItemTapped(int index) {
    currentIndex.value = index;
    update();
  }
}
