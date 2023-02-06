import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:hufi_vnvc_application/models/auth_model.dart';
import 'package:hufi_vnvc_application/models/register_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class AuthRepository {
  Future<ResponseAPI> login(
      String username, String password, String? fcmToken) async {
    var body = {
      'username': username,
      'password': password,
    };
    var resource = APIServices(
        url: "/api/auth/login?deviceId=$fcmToken",
        body: body,
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          return response;
        }));

    return await RequestAPI.instance.post(resource);
  }

  Future<bool> checkAccountExits(
      {required String phoneNumber, bool recoveryPassword = false}) async {
    var resource = APIServices(
        url:
            "/api/Auth/CheckUserExits?phoneNumber=$phoneNumber${recoveryPassword == true ? "&isRecovery=true" : ""}",
        parse: ((json) {
          print(json);
          var result = json["data"] as bool;
          return result;
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> changePassword(
      {required String username,
      required String oldPassword,
      required String newPassword}) async {
    var body = {
      "username": username,
      "oldPassword": oldPassword,
      "newPassword": newPassword
    };
    var resource = APIServices(
        url: "/api/Auth/changePassword",
        body: body,
        parse: ((json) {
          return ResponseAPI.fromJson(json);
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> register(RegisterModel model) async {
    var resource = APIServices(
        url: "/api/auth/register",
        body: model,
        parse: ((json) {
          print(json);
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> verifyCode(String code) async {
    var resource = APIServices(
        url: "/api/auth/verifyCode?code=$code",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> Logout(String accessToken, String refreshToken) async {
    var body = {'accessToken': accessToken, 'refreshToken': refreshToken};
    var resource = APIServices(
        url: "/api/auth/logout",
        body: body,
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> reSendVerifyCode(int userId) async {
    var resource = APIServices(
        url: "/api/auth/ResendVerifyCode?userId=$userId",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.post(resource);
  }
}
