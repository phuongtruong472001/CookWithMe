import 'package:get/get.dart';
import '../controller/tab_bar_home_controller.dart';

class TabBarHomeBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<TabBarHomeController>(() => TabBarHomeController());
    }
}
