import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../fonts_and_colors.dart';
import '../controller/detail_item_controller.dart';

class DetailItemPage extends GetView<DetailItemController> {
  const DetailItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 27,
                ),
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.red,
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
                        child: Text(
                          "Rainbow salad with salmon",
                          style: TextStyle(
                            color: HexColor("#437953"),
                            fontSize: 24,
                            fontFamily: FontsAndColors.regular,
                            fontWeight: FontWeight.w600,
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
                  child: Text(
                    "by @Alimeon",
                    style: TextStyle(
                      color: HexColor("#FF4345"),
                      fontSize: 18,
                      fontFamily: FontsAndColors.regular,
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 30),
                  child: Text(
                    '''medium yellow onion.
3 cloves. garlic.
1 tablespoon. olive oil.
1 pound. lean ground beef.
1 1/2 teaspoons. kosher salt, divided, plus more for the pasta water.
dried oregano.
freshly ground black pepper.
red pepper flakes (optional)''',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: FontsAndColors.regular,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 100, top: 10),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                      child: item(),
                    );
                  },
                  itemCount: 10,
                )
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
              onPressed: () {},
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
    );
  }

  Widget item() {
    return Column(
      children: [
        const SizedBox(
          height: 200,
        ),
        Text(
          '''To make this spaghetti sauce, you’ll sauté chopped onion, minced garlic, lean ground beef, and classic .''',
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
}
