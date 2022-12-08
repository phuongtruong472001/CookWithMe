import 'package:cook_with_me/pages/change_password/binding/change_password_binding.dart';
import 'package:cook_with_me/pages/change_password/view/change_password_view.dart';
import 'package:cook_with_me/pages/detail_item/binding/detail_item_binding.dart';
import 'package:cook_with_me/pages/detail_item/view/detail_item_view.dart';
import 'package:cook_with_me/pages/favorite/binding/favorite_binding.dart';
import 'package:cook_with_me/pages/favorite/view/favorite_view.dart';
import 'package:cook_with_me/pages/forgot_password/binding/forgot_password_binding.dart';
import 'package:cook_with_me/pages/forgot_password/view/forgot_password_view.dart';
import 'package:cook_with_me/pages/login_screen/login_view.dart';
import 'package:cook_with_me/pages/settings/binding/settings_binding.dart';
import 'package:cook_with_me/pages/settings/view/settings_view.dart';
import 'package:cook_with_me/pages/splash_screen/binding/splash_binding.dart';
import 'package:cook_with_me/pages/splash_screen/view/splash_view.dart';
import 'package:cook_with_me/pages/tab_bar_home/binding/tab_bar_home_binding.dart';
import 'package:cook_with_me/pages/tab_bar_home/view/tab_bar_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: HexColor("BCD6BE"),
      ),
      initialRoute: '/main_tabbar',
      initialBinding: TabBarHomeBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/forgot_password",
          page: () => const ForgotPasswordPage(),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: "/change_password",
          page: () => const ChangePasswordPage(),
          binding: ChangePasswordBinding(),
        ),
        GetPage(
          name: "/settings",
          page: () => const SettingsPage(),
          binding: SettingsBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginView(),
        ),
        GetPage(
            name: "/splash",
            page: () => const SplashPage(),
            binding: SplashBinding()),
        GetPage(
            name: "/main_tabbar",
            page: () => const TabBarHomePage(),
            binding: TabBarHomeBinding()),
        GetPage(
            name: "/favorite",
            page: () => FavoritePage(),
            binding: FavoriteBinding()),
        GetPage(
            name: "/detail_item",
            page: () => const DetailItemPage(),
            binding: DetailItemBinding()),
      ],
    );
  }
}
