import 'package:cook_with_me/model/API.dart';
import 'package:cook_with_me/model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
      print("can't call api "+error.toString());
    }
    return listPosts;
  }
}
