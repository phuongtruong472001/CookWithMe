import 'dart:convert' as convert;
import 'dart:io';
import 'package:cook_with_me/model/post_services.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/account.dart';
import 'package:cook_with_me/model/category.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CallApi {
  static Future<List<Post>> fetchPost(String url) async {
    //print(prefs.getString("jwt"));
    //final token = prefs.getString("jwt");

    //String url = API.linkPost;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    List<Post> listPosts = [];
    EasyLoading.show(status: "Loading...");
    try {
      final respone = await http.get(Uri.parse(url), headers: headers);
      var data = convert.jsonDecode(respone.body);
      List<dynamic> list = data["data"];
      //print(list);
      listPosts =
          list.isNotEmpty ? list.map((c) => Post.fromJson(c)).toList() : [];
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.showError("Co loi xay ra");
      print("can't call api $error");
    }
    return listPosts;
  }

  static Future<List<Category>> fetchCategory() async {
    //print(prefs.getString("jwt"));
    //final token = prefs.getString("jwt");

    String url = API.linkCategory;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    List<Category> listPosts = [];
    EasyLoading.show(status: "Loading...");
    try {
      final respone = await http.get(Uri.parse(url), headers: headers);
      var data = convert.jsonDecode(respone.body);
      List<dynamic> list = data["data"];
      print(list);
      listPosts =
          list.isNotEmpty ? list.map((c) => Category.fromJson(c)).toList() : [];
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.showError("Co loi xay ra");
      print("can't call api $error");
    }
    return listPosts;
  }

  static Future<Account> fetchMe() async {
    //print(prefs.getString("jwt"));
    var box = GetStorage();
    final token = box.read("tkn");

    String url = API.linkInforOfMe;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Token': "$token"
    };
    var account = Account();
    EasyLoading.show(status: "Loading...");
    try {
      final respone = await http.get(Uri.parse(url), headers: headers);
      var data = convert.jsonDecode(respone.body);
      var list = data["data"];
      print(list);
      account = Account.fromJson(list);
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.showError("Co loi xay ra");
      print("can't call api $error");
    }
    return account;
  }

  static Future<bool> logout() async {
    //print(prefs.getString("jwt"));
    var box = GetStorage();
    final token = box.read("tkn");

    String url = API.linkLogOut;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Token': "$token"
    };

    EasyLoading.show(status: "Log out...");
    try {
      final respone = await http.post(Uri.parse(url), headers: headers);
      if (respone.statusCode == 200) {
        EasyLoading.dismiss();
        return true;
      }
    } catch (error) {
      EasyLoading.showError("Co loi xay ra");
      print("can't call api $error");
      return false;
    }
    return false;
  }

  // authen
  static Future<bool> login(String email, String password) async {
    EasyLoading.show(status: "Loading...");
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
        box.write("user_id", data["data"]["user_id"]);
        print(data["data"]["user_id"]);
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("Email or password not correct !");
      }
    } catch (_) {
      EasyLoading.showError("Co loi xay ra");
      return false;
    }
    return false;
  }

  static Future<bool> changePassword(String email, String password) async {
    EasyLoading.show(status: "Loading...");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"email":"$email","password":"$password"}';
      final res = await post(Uri.parse(API.changePassword),
          headers: headers, body: body);

      if (res.statusCode == 200) {
        EasyLoading.showSuccess("Change password successed");
        // EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("Email or password not correct !");
      }
    } catch (_) {
      EasyLoading.showError("Co loi xay ra");
      return false;
    }
    return false;
  }

  static Future<bool> signUp(String email, String password) async {
    EasyLoading.show(status: "Loading...");
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
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("email not valid !");
      }
    } catch (_) {
      EasyLoading.showError("Co loi xay ra");
      return false;
    }
    return false;
  }

  static Future<bool> checkOTP(String email, String otp) async {
    EasyLoading.show(status: "Loading...");
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
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("OTP not correct !");
      }
    } catch (_) {
      EasyLoading.showError("Đã có lỗi xảy ra\nVui lòng thử lại sau");
      return false;
    }
    return false;
  }

  static Future<bool> sendOTP(String email) async {
    EasyLoading.show(status: "Loading...");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"email":"$email"}';
      final res =
          await post(Uri.parse(API.sendOTP), headers: headers, body: body);
      print(res.statusCode);
      // var data = convert.jsonDecode(res.body);
      if (res.statusCode == 200) {
        EasyLoading.dismiss();
        return true;
      } else {
        EasyLoading.showError("Emai not correct !");
      }
    } catch (_) {
      EasyLoading.showError("Đã có lỗi xảy ra\nVui lòng thử lại sau");
      return false;
    }
    return false;
  }

  static Future<List<Post>> searchPost(String keySearch) async {
    //print(prefs.getString("jwt"));
    //final token = prefs.getString("jwt");

    //String url = API.linkPost;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    List<Post> listPosts = [];
    String url = "${API.linkSearchPost}?key=$keySearch";
    print(url);
    EasyLoading.show(status: "Loading...");
    try {
      final respone = await http.get(Uri.parse(url), headers: headers);
      var data = convert.jsonDecode(respone.body);
      List<dynamic> list = data["data"];
      //print(list);
      listPosts =
          list.isNotEmpty ? list.map((c) => Post.fromJson(c)).toList() : [];
      EasyLoading.dismiss();
    } catch (error) {
      EasyLoading.showError("Co loi xay ra");
      print("can't call api $error");
    }
    return listPosts;
  }
}
