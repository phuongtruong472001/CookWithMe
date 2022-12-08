import 'package:cook_with_me/pages/forgot_password/binding/forgot_password_binding.dart';
import 'package:cook_with_me/pages/forgot_password/view/forgot_password_view.dart';
import 'package:cook_with_me/pages/login_screen/login_binding.dart';
import 'package:cook_with_me/pages/login_screen/login_view.dart';
import 'package:cook_with_me/pages/splash_screen/binding/splash_binding.dart';
import 'package:cook_with_me/pages/splash_screen/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      ),
      initialRoute: '/splash',
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/forgot_password",
          page: () => const ForgotPasswordPage(),
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: "/splash",
          page: () => const SplashPage(),
          binding: SplashBinding()
        ),
      ],
    );
  }
}
