import 'dart:async';
import 'package:cook_with_me/model/API.dart';
import 'package:dio/dio.dart';

class FoodServices {
  static Future<bool> create(FormData data) async {
    try {
      Dio dio = Dio();
      // dio.options.headers["content-Type"] = "application/json";
      // dio.options.headers["Accept"] = "application/json";
      var response = await dio.post(API.linkPost,
          data: data,
          options: Options(
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
            },
            // contentType:
          ));
      if (response.statusCode == 201) {
        return true;
      }
      print(response.statusCode);
      return false;
    } catch (e) {
      return false;
    }
  }
}
