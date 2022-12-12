import 'package:cook_with_me/fonts_and_colors.dart';
import 'package:cook_with_me/pages/all_food/view/all_food_view.dart';
import 'package:cook_with_me/pages/favorite/view/favorite_view.dart';
import 'package:cook_with_me/pages/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../settings/view/settings_view.dart';
import '../controller/tab_bar_home_controller.dart';

class TabBarHomePage extends GetView<TabBarHomeController> {
  const TabBarHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 27,
                width: 27,
                child: Icon(
                  Icons.home,
                ),
              ),
              label: 'Materials',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 27,
                width: 27,
                child: Icon(
                  Icons.favorite,
                ),
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 27,
                width: 27,
                child: Icon(
                  Icons.person,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedLabelStyle: TextStyle(
              fontFamily: FontsAndColors.regular,
              fontSize: 11,
              color: Colors.red),
          unselectedLabelStyle: TextStyle(
              fontFamily: FontsAndColors.regular,
              fontSize: 11,
              color: Colors.black12),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black12,
          // unselectedFontSize: 11,
          // selectedFontSize: 11,
          onTap: (index) {
            // controller.currentIndex.value = index;
            controller.onItemTapped(index);
          },
        ),
      ),
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.currentIndex.value,
              children: [
                HomePage(),
                FavoritePage(),
                AllFoodPage(),
              ],
            )),
      ),
    );
  }
}
