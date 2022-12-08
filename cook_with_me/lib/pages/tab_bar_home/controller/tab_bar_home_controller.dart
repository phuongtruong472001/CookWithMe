import 'package:get/get.dart';

class TabBarHomeController extends GetxController {
  RxInt currentIndex = 0.obs;
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

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
