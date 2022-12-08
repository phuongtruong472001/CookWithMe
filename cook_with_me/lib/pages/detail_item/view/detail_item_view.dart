import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/detail_item_controller.dart';

class DetailItemPage extends GetView<DetailItemController> {
  const DetailItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: const [],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: Get.width,
                    color: Colors.red,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          color: Colors.blueAccent,
                        ),
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
                child: const Text('WATCH VIDEO'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
