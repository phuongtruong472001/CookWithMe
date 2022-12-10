import 'dart:convert' as convert;
import 'dart:io';
import 'package:cook_with_me/model/post_services.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/category.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CallApi {
  static Future<List<Post>> fetchPost() async {
    //print(prefs.getString("jwt"));
    //final token = prefs.getString("jwt");

    String url = API.linkPost;
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
      print(list);
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
      String body = '{"email":"$email""}';
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

  // search
  static Future<List<Post>> searchFood(String nameFood) async {
    try {
      List<Post> foods = await CallApi.fetchPost();
      return foods.where((f) {
        final nameFoodLower = f.title!.toLowerCase();
        final searchLower = nameFood.toLowerCase();
        return nameFoodLower.contains(searchLower);
      }).toList();
    } catch (ex) {
      rethrow;
    }
  }

  // add a new post
  static Future<bool> uploadNewFood(
      String name,
      String ingredient,
      String step1,
      String linkVideo,
      File? fileImgFood,
      File? fileImgStep1) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      if (name.isEmpty ||
          ingredient.isEmpty ||
          step1.isEmpty ||
          linkVideo.isEmpty) {
        print("emptyyyyyy");
        return false;
      }

      Steps step = Steps(
        name: "name",
        description: "step1",
        imageLink: await Dio.MultipartFile.fromFile(fileImgStep1!.path,
            filename: fileImgStep1.path.split('/').last),
      );
      Dio.FormData formData = Dio.FormData.fromMap({
        "title": "Canh",
        "videoLink": linkVideo,
        "steps": ["name: 1"],
        "ingredients": ["name: 2"],
        "category": "6392b969899de4b4664beee9",
        "imageCover": await Dio.MultipartFile.fromFile(fileImgFood!.path,
            filename: fileImgFood.path.split('/').last),
      });
      bool result = await FoodServices.create(formData);
      return result;
    } catch (e) {
      // ignore: avoid_print
      print('Lỗi khi thêm');
      return false;
    }
  }
}
