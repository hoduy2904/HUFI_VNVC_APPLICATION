import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hufi_vnvc_application/constaint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIServices<T> {
  final String url;
  final String fullUrl;
  Map<String, String>? headers;
  final dynamic? body;
  T Function(dynamic json) parse;
  String finalUrl() => url.isEmpty ? fullUrl : HOST + url;
  APIServices(
      {required this.url,
      this.fullUrl = "",
      this.headers,
      this.body,
      required this.parse});
}

class RequestAPI {
  Future<T> get<T>(APIServices<T> resource) async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getStringList("authToken");
    if (authToken != null) {
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json',
        "Authorization": authToken[0]
      };
    }
    var request = await http.get(Uri.parse(resource.finalUrl()),
        headers: resource.headers);
    if (request.statusCode == 200) {
      var jsonDecodeUtf8 = jsonDecode(utf8.decode(request.bodyBytes));
      return resource.parse(jsonDecodeUtf8);
    } else if (request.statusCode == 401) {
      if (prefs.containsKey("authToken")) {
        var token = prefs.getStringList("authToken") as List;
        if (await refreshToken(token[0], token[1])) {
          return await get(resource);
        }
      }
      throw Exception("Vui lòng đăng nhập lại");
    } else {
      var body = jsonDecode(request.body);
      var message = body.message as List;
      throw Exception(message.first);
    }
  }

  Future<T> post<T>(APIServices<T> resource) async {
    final prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getStringList("authToken");
    if (authToken != null) {
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json',
        "Authorization": authToken[0]
      };
    }
    var request = await http.post(Uri.parse(resource.finalUrl()),
        headers: resource.headers, body: jsonEncode(resource.body));
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      if (prefs.containsKey("authToken")) {
        var token = prefs.getStringList("authToken") as List;
        if (await refreshToken(token[0], token[1])) {
          return await post(resource);
        }
      }
      throw Exception("Vui lòng đăng nhập lại");
    } else {
      var body = jsonDecode(request.body);
      var message = body.message as List;
      throw Exception(message.first);
    }
  }

  Future<bool> refreshToken(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    var body = jsonEncode({accessToken, refreshToken});
    var request =
        await http.post(Uri.parse("/api/auth/refreshtoken"), body: body);
    if (request.statusCode == 200) {
      var list = request.body as List;
      prefs.setStringList("token", [list[0], list[1]]);
      return true;
    } else {
      prefs.clear();
      return false;
    }
  }
}
