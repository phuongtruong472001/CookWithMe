import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:cook_with_me/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../fonts_and_colors.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Obx((() => search(controller.searchController.value))),
              const SizedBox(
                height: 30,
              ),
              Obx(() => _buildBody(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget search(TextEditingController searchController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: TextFormField(
            onChanged: ((value) {
              controller.keySearch.value = value.toString();
              print(controller.keySearch.value);
            }),
            controller: searchController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: HexColor("#000000"),
              fontFamily: 'Nunito-Semibold',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
                suffixIcon: controller.keySearch.value == ""
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        color: const Color.fromARGB(255, 81, 48, 67),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          controller.keySearch.value = "";
                          controller.searchController.value.clear();
                        },
                      ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter food name",
                hintStyle: TextStyle(
                  color: HexColor("#C1C1C1"),
                  fontFamily: 'Nunito-Semibold',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(16))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name.';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    if (controller.keySearch.value == "") {
      return noKeySearch();
    }
    controller.getListSearch(controller.keySearch.value);
    return Obx(
      () => GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 150),
          itemCount: controller.listSearch.length,
          itemBuilder: (BuildContext context, int index) {
            return PostWidget(
              post: controller.listSearch[index],
            );
          }),
    );
  }

  Widget noKeySearch() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommend',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 170,
          child: Obx(() => ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: controller.listPosts.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: PostWidget(
                        post: controller.listPosts[index],
                      ));
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All food',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 330,
          child: Obx(
            () => GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 4, bottom: 20),
                //physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 150),
                itemCount: controller.listPosts.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostWidget(
                    post: controller.listPosts[index],
                  );
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent View',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: FontsAndColors.regular,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 150,
          child: Obx(
            () => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.listPosts.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: PostWidget(
                    post: controller.listPosts[index],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
