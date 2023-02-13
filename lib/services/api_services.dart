import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';
import 'package:hufi_vnvc_application/constaint.dart';
import 'package:hufi_vnvc_application/models/login_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIServices<T> {
  final String url;
  final String fullUrl;
  Map<String, String>? headers;
  final dynamic body;
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
  static final RequestAPI instance = RequestAPI._internal();
  factory RequestAPI() {
    return instance;
  }
  RequestAPI._internal();

  final _controller = StreamController<AuthStatus>.broadcast();
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  final client = RetryClient(http.Client(),
      delay: ((retryCount) => const Duration(milliseconds: 1000)),
      retries: 1, when: (response) async {
    return response.statusCode == 401 ? true : false;
  }, onRetry: (req, res, retryCount) async {
    if (retryCount == 0 && res?.statusCode == 401) {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("accessToken")) {
        await RequestAPI().refreshToken();
        var accessToken = prefs.getString("accessToken");
        var accessTokenType = prefs.getString("accessToken_Type");
        req.headers.update(
            "Authorization", ((value) => "$accessTokenType $accessToken"));
      }
    }
  });
  Future<T> get<T>(APIServices<T> resource) async {
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
    try {
      var request = await client.get(Uri.parse(resource.finalUrl()),
          headers: resource.headers);

      if (request.statusCode == 200) {
        var jsonDecodeUtf8 = jsonDecode(utf8.decode(request.bodyBytes));
        return resource.parse(jsonDecodeUtf8);
      } else if (request.statusCode == 401) {
        throw Exception("401");
      } else {
        var body = jsonDecode(request.body);
        var message = body.message as List;
        throw Exception(message.first);
      }
    } catch (e) {
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
    var request = await client.post(Uri.parse(resource.finalUrl()),
        headers: resource.headers, body: jsonEncode(resource.body));
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      throw Exception("401");
    } else {
      throw Exception(request.body);
    }
  }

  Future<T> put<T>(APIServices<T> resource) async {
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
    var request = await client.put(Uri.parse(resource.finalUrl()),
        headers: resource.headers, body: jsonEncode(resource.body));
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      throw Exception("401");
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
    var request = await client.delete(Uri.parse(resource.finalUrl()),
        headers: resource.headers);
    if (request.statusCode == 200) {
      return resource.parse(jsonDecode(utf8.decode(request.bodyBytes)));
    } else if (request.statusCode == 401) {
      throw Exception("401");
    } else {
      throw Exception(request.body);
    }
  }

  Future<bool> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    var deviceId = prefs.getString("deviceId");
    var accessToken = prefs.getString("accessToken");
    var refreshToken = prefs.getString("refreshToken");
    var body = {'accessToken': accessToken, 'refreshToken': refreshToken};
    var resource = APIServices(
        url: "/api/Auth/RefreshToken?deviceId=$deviceId",
        body: body,
        headers: {
          "Content-type": "application/json",
          'Accept': 'application/json'
        },
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
      _controller.add(AuthStatus.unAuthentication);
      return false;
    }
  }

  Future<ResponseAPI> postFile(
      {required File file, Map<String, String>? headers}) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("$HOST/api/Upload/UploadImage"));
    var pic = http.MultipartFile(
        "file", file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path.split("/").last);
    request.files.add(pic);
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

  void dispose() => _controller.close();
}
