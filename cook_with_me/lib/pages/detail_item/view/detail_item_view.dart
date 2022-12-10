import 'package:cook_with_me/pages/link_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../fonts_and_colors.dart';
import '../../../model/post.dart';
import '../controller/detail_item_controller.dart';

class DetailItemPage extends GetView<DetailItemController> {
  String defaultImage = LinkImage.imageDefault;

  DetailItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.post.value.imageCover ?? defaultImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 3 / 5,
                          child: Obx(
                            () => Text(
                              controller.post.value.title ?? "",
                              style: TextStyle(
                                color: HexColor("#437953"),
                                fontSize: 24,
                                fontFamily: FontsAndColors.regular,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Obx(
                      () => Text(
                        "by ${controller.post.value.author!.email}",
                        style: TextStyle(
                          color: HexColor("#FF4345"),
                          fontSize: 18,
                          fontFamily: FontsAndColors.regular,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 30),
                    child: Text(
                      "INGREDIENTS",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: FontsAndColors.semibold,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 100, top: 10),
                      itemBuilder: (context, index) {
                        var ingredients =
                            controller.post.value.ingredients ?? [];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 16, right: 16),
                          child: Text(
                            ingredients[index].name ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: FontsAndColors.regular,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                      itemCount: controller.post.value.ingredients!.length,
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 100, top: 10),
                      itemBuilder: (context, index) {
                        var steps = controller.post.value.steps ?? [];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 16, right: 16),
                          child: item(steps[index]),
                        );
                      },
                      itemCount: controller.post.value.steps!.length,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 16,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black87,
                  fixedSize: Size(Get.width - 32, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                ),
                onPressed: ()=>launchURL(),
                child: Text(
                  'WATCH VIDEO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: FontsAndColors.regular,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget item(Steps steps) {
    String imageLink = steps.imageLink ?? defaultImage;
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageLink), fit: BoxFit.cover),
          ),
        ),
        Text(
          steps.description ?? "",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: FontsAndColors.regular,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  launchURL() async {
    const url = 'https://www.youtube.com/watch?v=nD2k199_HBM&ab_channel=Nino%27sHome';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
