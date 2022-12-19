import 'dart:convert' as convert;
// import 'dart:convert';
import 'dart:io';
import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/account.dart';
import 'package:cook_with_me/model/category.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:cook_with_me/pages/add_post/controller/post_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// ignore: library_prefixes
import 'package:dio/dio.dart' as Dio;

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

// get image link
  static Future<String> upImage(File? file) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      String body = '{"file":$file}';
      final res = await post(
          Uri.parse(
              "https://cookwithmebe-production.up.railway.app/image/upload"),
          headers: headers,
          body: body);
      var data = convert.jsonDecode(res.body);
      if (res.statusCode == 201) {
        print("up anh ${data["status"]}");
        return data["data"];
      }
      return "";
    } catch (e) {
      throw Exception(e);
    }
  }

// using DIO
  static Future<bool> uploadPost(File? fileImgPost, String cate, String name,
      String ingre, String step, String link, File? fileImgStep) async {
    try {
      Map<String, dynamic> steps = {
        "name": "Step1",
        "description": step,
        "imageLink": await CallApi.upImage(fileImgStep),
        // "imageLink":
        //     "https://i.pinimg.com/originals/6c/d5/51/6cd5515e7db2b976de0de66c5fdec4e6.jpg",
      };
      List<Map<String, dynamic>> listSteps = [];
      listSteps.add(steps);
      List<Steps> list1 = listSteps.map((e) => Steps.fromJson(e)).toList();
      // use to json
      Map<String, dynamic> ingredients = {
        "name": ingre,
      };
      List<Map<String, dynamic>> listIngre = [];
      listIngre.add(ingredients);
      List<Ingredients> list2 =
          listIngre.map((e) => Ingredients.fromJson(e)).toList();
      var box = GetStorage();
      final userID = box.read("user_id");

      Map formData = {
        "author": userID,
        "title": name.toString(),
        "image_cover":
            "https://i.pinimg.com/originals/6c/d5/51/6cd5515e7db2b976de0de66c5fdec4e6.jpg",
        // "image_cover": await Dio.MultipartFile.fromFile(fileImgPost!.path,
        //     filename: fileImgPost.path.split('/').last),
        "steps": list1[0].toJson(),
        "ingredients": list2[0].toJson(),
        "video_link": link,
        "categories": ["6392b969899de4b4664beee9"]
      };
      bool result = await FoodServices.create(formData);
      return result;
    } catch (e) {
      print("call_api $e");
      return false;
    }
  }
//
}
