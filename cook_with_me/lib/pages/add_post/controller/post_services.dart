import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class FoodServices{
static Future<bool> create(FormData data) async {
  var box = GetStorage();
    final token = box.read("tkn");
     Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Token': '$token'
    };
    try {
      Response response =
      await Dio().post(
          "https://cookwithmebe-production.up.railway.app/posts",
          data: data,
          options: Options(headers: headers)
      );
      if(response.statusCode==201){
        return true;
      }
      return false;
    } catch(e){
      return false;
    }
  }
}