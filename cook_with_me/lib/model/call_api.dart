import 'dart:convert' as convert;

import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CallApi {
  static Future<List<Post>> fetchAreas() async {
    //print(prefs.getString("jwt"));
    //final token = prefs.getString("jwt");

    String url = API.linkPost;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    List<Post> listPosts = [];
    //EasyLoading.show(status: "Đang lấy thông tin khu vực");
    try {
      final respone = await http.get(Uri.parse(url), headers: headers);
      var data = convert.jsonDecode(respone.body);
      List<dynamic> list = data["data"];
      print(list);
      listPosts =
          list.isNotEmpty ? list.map((c) => Post.fromJson(c)).toList() : [];
    } catch (error) {
      print("can't call api $error");
    }
    return listPosts;
  }

  // authen
  static Future<bool> login(String email, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"email":"$email","password":"$password"}';
      final res =
          await post(Uri.parse(API.linkLogin), headers: headers, body: body);
      var data = convert.jsonDecode(res.body);
      if (res.statusCode == 200) {
        var box = GetStorage();
        box.write("tkn", data["data"]["token"]);
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  static Future<bool> signUp(String email, String password) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"email":"$email","password":"$password"}';
      final res =
          await post(Uri.parse(API.linkRegister), headers: headers, body: body);
      // var data = convert.jsonDecode(res.body);
      if (res.statusCode == 201) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }

  static Future<bool> checkOTP(String email, String otp) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"email":"$email","otp":"$otp"}';
      final res =
          await post(Uri.parse(API.checkOTP), headers: headers, body: body);
      print(res.statusCode);
      // var data = convert.jsonDecode(res.body);
      if (res.statusCode == 200) {
        return true;
      }
    } catch (_) {
      return false;
    }
    return false;
  }
}
