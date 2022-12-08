import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostWidgetController extends GetxController {
  RxBool isFavorite = false.obs;

  void onTapChangeFavorite() {
    isFavorite.value = !(isFavorite.value);
  }
}

class PostWidget extends GetView<PostWidgetController> {
  PostWidget({super.key}) {
    Get.lazyPut<PostWidgetController>(() => PostWidgetController());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.2))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 93,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Text(
                "Meat Fried ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: FontsAndColors.semibold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "@Alimeno",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: FontsAndColors.regular,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.onTapChangeFavorite(),
                    child: Obx(() => controller.isFavorite.value == true
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
