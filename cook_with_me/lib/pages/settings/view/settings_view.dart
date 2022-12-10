import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../link_image.dart';
import '../controller/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  SettingsPage({Key? key}) : super(key: key) {
    Get.put(SettingsController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
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
                onPressed: () {
                  Get.toNamed("/change_password");
                },
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
      ),
    );
  }
}
