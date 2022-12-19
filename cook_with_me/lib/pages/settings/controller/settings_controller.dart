import 'package:cook_with_me/model/account.dart';
import 'package:cook_with_me/model/call_api.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Rx<Account> account = Account().obs;
  void loadData() async {
    account.value = (await CallApi.fetchMe());
  }

  @override
  void onReady() {}
}
