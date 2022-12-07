import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controller/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("Meomeo123"),
            const Text("Meomeo123@gmail.com"),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: HexColor("#FD1616"),
                fixedSize: Size(Get.width - 100, 50),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Edit profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: HexColor("#FD1616"),
                fixedSize: Size(Get.width - 100, 50),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Change password',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(Get.width - 100, 50),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    side: BorderSide(
                      color: HexColor("#FF0000"),
                      width: 2,
                    )),
              ),
              onPressed: () {},
              child: Text(
                'LOG OUT',
                style: TextStyle(
                  color: HexColor("#FF0000"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
