import 'package:cook_with_me/model/account.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  @override
  void onInit() async {
    Account account = await CallApi.fetchMe();
    print(account.email);
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }
}
