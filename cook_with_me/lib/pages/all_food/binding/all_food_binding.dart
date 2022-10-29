import 'package:get/get.dart';
import '../controller/all_food_controller.dart';

class AllFoodBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<AllFoodController>(() => AllFoodController());
    }
}
