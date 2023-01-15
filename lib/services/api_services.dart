import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIServices<T> {
  final String url;
  final String fullUrl;
  Map<String, String>? headers;
  final dynamic? body;
  T Function(dynamic json) parse;
  String finalUrl() => url.isEmpty ? fullUrl : url;
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
    } else {
      throw Exception(request.statusCode);
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
    } else {
      throw Exception(request.statusCode);
    }
  }
}
