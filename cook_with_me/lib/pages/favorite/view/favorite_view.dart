import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/favorite_controller.dart';

class FavoritePage extends GetView<FavoriteController> {
   FavoritePage({Key? key}) : super(key: key){
     Get.lazyPut<FavoriteController>(() => FavoriteController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Favorite"),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 4, bottom: 20),
                    //physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent: 176),
                    itemCount: controller.lenght.value,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.red,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
