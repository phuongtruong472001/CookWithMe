import 'package:get/get.dart';
import '../controller/detail_item_controller.dart';

class DetailItemBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<DetailItemController>(() => DetailItemController());
    }
}
