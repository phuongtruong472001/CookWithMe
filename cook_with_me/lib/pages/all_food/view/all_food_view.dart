import 'package:cook_with_me/model/call_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../fonts_and_colors.dart';
import '../../../model/post.dart';
import '../../link_image.dart';
import '../controller/all_food_controller.dart';

class AllFoodPage extends GetView<AllFoodController> {
  AllFoodPage({Key? key}) : super(key: key) {
    Get.put(AllFoodController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          bool checkLogout = await CallApi.logout();
                          if (checkLogout) {
                            Get.offAllNamed("/login");
                          }
                        },
                        icon: const Icon(Icons.logout)),
                  ),
                ),
                Obx(
                  () => Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.account.value.avatarLink ??
                                  LinkImage.avatarDefault),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Text(controller.account.value.email ?? ""),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: HexColor("FA6163"),
                    fixedSize: Size(Get.width - 100, 50),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed("/add_post");
                  },
                  child: const Text(
                    '+ ADD ITEM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: controller.listPosts.length,
                    itemBuilder: (context, index) {
                      Post post = controller.listPosts[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 220,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(2, 4),
                                    blurRadius: 10,
                                    color: Color.fromRGBO(0, 0, 0, 0.25))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(
                                  "/detail_item",
                                  arguments: {"post": post},
                                ),
                                child: Container(
                                  height: 176,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: NetworkImage(post.imageCover ??
                                            LinkImage.imageDefault),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        child: const Icon(
                                          Icons.more_vert,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 8, right: 8),
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(
                                    post.title ?? "",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: HexColor("437953"),
                                      fontSize: 20,
                                      fontFamily: FontsAndColors.semibold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
