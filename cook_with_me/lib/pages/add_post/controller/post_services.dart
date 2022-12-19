import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class FoodServices {
  static Future<bool> create(Map data) async {
    var box = GetStorage();
    final token = box.read("tkn");

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Token': '$token',
    };
    try {
      Response response = await Dio().post(
          "https://cookwithmebe-production.up.railway.app/posts",
          data: data,
          options: Options(headers: headers));
      //
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      } else {
        print("response.statusCode=${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("post_services $e");
      return false;
    }
  }
}
