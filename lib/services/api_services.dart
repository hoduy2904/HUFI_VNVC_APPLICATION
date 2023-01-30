import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:hufi_vnvc_application/constaint.dart';
import 'package:hufi_vnvc_application/models/login_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
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
    if (prefs.containsKey("accessToken")) {
      var accessToken = prefs.getString("accessToken");
      var accessTokenType = prefs.getString("accessToken_Type");
      resource.headers ??= {
        'Accept': 'application/json',
        "Authorization": "$accessTokenType $accessToken"
      };
    } else {
      resource.headers ??= {'Accept': 'application/json'};
    }
    try {
      var request = await http.get(Uri.parse(resource.finalUrl()),
          headers: resource.headers);
      if (request.statusCode == 200) {
        var jsonDecodeUtf8 = jsonDecode(utf8.decode(request.bodyBytes));
        return resource.parse(jsonDecodeUtf8);
      } else if (request.statusCode == 401) {
        if (prefs.containsKey("accessToken")) {
          var token = prefs.getString("accessToken");
          var refreshTokenValue = prefs.getString("refreshToken");
          if (await refreshToken(token!, refreshTokenValue!)) {
            return await get(resource);
          }
        }
        throw Exception("Vui lòng đăng nhập lại");
      } else {
        var body = jsonDecode(request.body);
        var message = body.message as List;
        throw Exception(message.first);
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<T> post<T>(APIServices<T> resource) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("accessToken")) {
      var accessToken = prefs.getString("accessToken");
      var accessTokenType = prefs.getString("accessToken_Type");
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json',
        "Authorization": "$accessTokenType $accessToken"
      };
    } else {
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json'
      };
    }
    var request = await http.post(Uri.parse(resource.finalUrl()),
        headers: resource.headers, body: jsonEncode(resource.body));
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      if (prefs.containsKey("accessToken")) {
        var token = prefs.getString("accessToken");
        var refreshTokenValue = prefs.getString("refreshToken");
        if (await refreshToken(token!, refreshTokenValue!)) {
          return await post(resource);
        }
      }
      throw Exception("Vui lòng đăng nhập lại");
    } else {
      throw Exception(request.body);
    }
  }

  Future<T> delete<T>(APIServices<T> resource) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("accessToken")) {
      var accessToken = prefs.getString("accessToken");
      var accessTokenType = prefs.getString("accessToken_Type");
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json',
        "Authorization": "$accessTokenType $accessToken"
      };
    } else {
      resource.headers ??= {
        "Content-type": "application/json",
        'Accept': 'application/json'
      };
    }
    var request = await http.delete(Uri.parse(resource.finalUrl()),
        headers: resource.headers);
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      if (prefs.containsKey("accessToken")) {
        var token = prefs.getString("accessToken");
        var refreshTokenValue = prefs.getString("refreshToken");
        if (await refreshToken(token!, refreshTokenValue!)) {
          return await post(resource);
        }
      }
      throw Exception("Vui lòng đăng nhập lại");
    } else {
      throw Exception(request.body);
    }
  }

  Future<bool> refreshToken(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    var deviceId = prefs.getString("deviceId");
    var body = {'accessToken': accessToken, 'refreshToken': refreshToken};
    var resource = APIServices(
        url: "/api/auth/refreshtoken?deviceId=$deviceId",
        body: body,
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    var response = await RequestAPI().post(resource);
    if (response.statusCode == 200 && response.isSuccess) {
      var login = LoginModel.fromJson(response.data);
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("accessToken_Type", login.accessToken_Type);
      prefs.setString("accessToken", login.accessToken);
      prefs.setString("refreshToken", login.refreshToken);
      prefs.setString("user", jsonEncode(login.user));
      prefs.setString("deviceId", deviceId!);
      return true;
    } else {
      prefs.clear();
      return false;
    }
  }

  Future<ResponseAPI> postFile(
      {required List<File> files, Map<String, String>? headers}) async {
    var request = http.MultipartRequest("POST", Uri.parse("/api/upload"));
    for (var file in files) {
      var pic = http.MultipartFile(
          "file", file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path.split("/").last);
      request.files.add(pic);
    }
    request.headers.addAll(headers ?? {});
    var response = await request.send();
    if (response.statusCode == 200) {
      return ResponseAPI.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
    return ResponseAPI(
        statusCode: response.statusCode,
        messages: ["Faild to upload"],
        isSuccess: false,
        data: null);
  }
}
